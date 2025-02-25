function MLL = RobotLL(DH)  

    AA = Tlinks(DH);
    Org = LinkOrigins(AA);
    MLL = diff(Org, 1, 2);

end

