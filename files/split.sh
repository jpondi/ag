awk '/^[0-9]{3}/ { 
    if (song) { 
        print song > "AH" sprintf("%03d", song_num) ".txt" 
    } 
    song_num++ 
    song = $0 
    next 
} 
{
    song = song "\n" $0 
} 
END { 
    print song > "AH" sprintf("%03d", song_num) ".txt" 
}' Allhymns.txt
