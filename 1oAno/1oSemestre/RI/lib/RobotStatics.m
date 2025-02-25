function [FF, MM] = RobotStatics(DH, MCii, mm, Fe, Me, g)
    % FF - matriz (3 ˆ n) dos vetores das for¸cas transmitidas aos elos interiores
    % (incluido a base de suporte - elo 0): fi,i´1, para i “ 1, ..., n
    % MM - matriz (3 ˆ n) dos momentos aplicados em cada junta: μi,i´1, para
    % i “ 1, ..., n
    % DH - matriz DH (n ˆ 4) para a configura¸c˜ao corrente do robˆo
    % MCii - matriz (3 ˆ n) dos centros de massa nas referˆencias de repouso
    % mm - vetor (n ˆ 1) das massas dos elos
    % Fe - vetor (3 ˆ 1) da for¸ca externa aplicada ao elo terminal
    % Me - vetor (3 ˆ 1) do momento externo aplicado ao elo terminal
    % g - vetor (3 ˆ 1) da acelera¸c˜ao da gravidade

    N = size(DH, 1);
    FF = zeros(3, N);
    MM = FF;

    MLL = RobotLL(DH);
    MCL = RobotCOM(DH,MCii);

    Fp = Fe;
    Mp = Me;

    for i=N:-1:1        % backwards
        rC = MCL(:,i);
        rL = MLL(:,i);
        [F,M] = LinkStatics(mm(i),rC,rL,Fp,Mp,g);
        Fp = F;
        Mp = M;
        FF(:,i) = Fp;
        MM(:,i) = Mp;
    end

end

