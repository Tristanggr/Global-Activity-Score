function Score=Analyse_Donnes(Type)
    filename="C:\Users\antho\Documents\IDS\Sante_Activite_Physique\Scilab\DAT\Pierre1.csv"
    //On exporte les données dans la matrice  M
    M = csvRead(filename,",", [], 'string')
    
    // Tri des données
    Temps = M(:,1)
    Heures= strtod(part(Temps,12:13))
    Minutes= strtod(part(Temps,15:16))
    Secondes= strtod(part(Temps,18:19))
    Jours=strtod(part(Temps,9:10))
    //Format en secondes des données
    T_Raw=Jours*(24*3600)+Heures*3600+Minutes*60+Secondes
    //Retour à 0 de la timeLine
    T=T_Raw-T_Raw(1)
    
    X_Raw=strtod(M(:,2),".")
    Y_Raw=strtod(M(:,3),".")
    Z_Raw=strtod(M(:,4),".")

    //Utilisation des données sur 1 journées maximum
    H_Deb=T_Raw(1)
    H_Fin=H_Deb+24*3600
    i=1
    
    while(T_Raw(i)<H_Fin && i<size(T_Raw)(1))
        i=i+1
    end
    X=X_Raw((1:i))
    Y=Y_Raw((1:i))
    Z=Z_Raw((1:i))
    T=T((1:i))
    
    //Calcul de la Norme Euclidienne moins 1 pour mesuer l'accélération du poignets et donc l'activité physique
    
    NE= sqrt(X^2+Y^2+Z^2)
    ENMO=NE-1
    
    n_ENMO=size(ENMO)
    n_T=size(T)
    figure(1)
    plot(T,ENMO)
    
    //Calculs des moyennes d'activités physiques toutes les 10 minutes
    deb_epoch_T=T(1)//Varaiable permettant de savoir le Début de l'epoch donc des 10 minutes
    deb_epoch_N=1// Varaibles pour savoir la position du début d'epoch
    n_epoch=1// Varaibles pour savoir le nombre d'epoch
    i=1
    
    while( i<=n_ENMO(1))
        if(T(i)-deb_epoch_T>600)//Toutes les 10 minutes :
            val=mean(ENMO(deb_epoch_N:i),1) // On fait la moyenne des valeurs
            if(val<0)
                val=-val
            end
            Epoch(n_epoch).val=val//On enregistre la valeur de la moyenne
            Epoch(n_epoch).deb=deb_epoch_T// Puis le début
            Epoch(n_epoch).fin=T(i)//Puis la fin de l'epoch
            Epoch_val(n_epoch)=Epoch(n_epoch).val// Ainsi que la valeur moyenne
            Epoch_milieu(n_epoch)=(T(i)-deb_epoch_T)/2+deb_epoch_T
            n_epoch=n_epoch+1// On change d'epoch
            deb_epoch_N=i//Donc on modifie le debut de l'epoch
            deb_epoch_T=T(i)
            end
        i=i+1//Nous traversons toute la matrice
    end
    
    //On enregistre la dernière epoch
    val=mean(ENMO(deb_epoch_N:i-1),1)
    if(val<0)
        val=-val    
    end
    Epoch(n_epoch).val=val
    Epoch(n_epoch).deb=deb_epoch_T;
    Epoch(n_epoch).milieu=(T(i-1)-deb_epoch_T)/2+deb_epoch_T
    Epoch(n_epoch).fin=T(i-1);
    Epoch_val(n_epoch)=Epoch(n_epoch).val
    Epoch_milieu(n_epoch)=(T(i-1)-deb_epoch_T)/2+deb_epoch_T
    
    //Tracer de l'ensemble des valeurs des epochs
    figure(7)
    plot2d("nn",Epoch_milieu,Epoch_val)
    
    //Identification des seuils
    n_Light=1
    n_Moderate=1
    n_Vigorous=1
    j=1
    while(j<=n_epoch)
        Current=Epoch(j)
        val=Current.val
        if(val<0,4)
        elseif(val<0.7) 
            Light(n_Light)=Current
            n_Light=n_Light+1
        elseif (val<0.9) 
            Moderate(n_Moderate)=Current
            n_Moderate=n_Moderate+1
        else 
            Vigorous(n_Vigorous)=Current
            n_Vigorous=n_Vigorous+1
        end
        j=j+1
    end
  
     [S,Score]=Calcul_Score(n_Vigorous,n_Vigorous,n_Vigorous,Type)//Calcul du score

endfunction

//Calcul du score en fonction des temps passés à différentes intensités et selon le type d'utilisateur
function [S,Score]=Calcul_Score(Nb_Temps1,Nb_Temps2,Nb_Temps3,Type)
    if(Type==1)
        S=Nb_Temps1*3+Nb_Temps2*2+Nb_Temps3;
     elseif(Type==2)
        S=Nb_Temps1*3+Nb_Temps2*2;
    else
        S=Nb_Temps1;
    end
    if(S>27)//Equivalent 4h30 d'activité physique
        Score=10
    elseif(S>24)//Equivalent 4h  d'activité physique
        Score=9
    elseif(S>21)///Equivalent 3h30 d'activité physique
        Score=8
    elseif(S>18)//Equivalent 3h d'activité physique
        Score=7
    elseif(S>15)//Equivalent 2h30 d'activité physique
        Score=6
    elseif(S>12)//Equivalent 2h d'activité physique
        Score=5
    elseif(S>9)//Equivalent 1h30 d'activité physique
        Score=4
    elseif(S>6)//Equivalent 1h d'activité physique
        Score=3
    elseif(S>3)//Une demi-heure d'activité physique
        Score=2
    else//Pas d'activité physique
        Score=1
    end

endfunction
