function [FFF,MMM] = RobotMultiStatics(MDH,MCii,mm,Fe,Me,g)
    % FFF - hipermatriz (3 ˆ n ˆ K ) dos vetores das for¸cas transmitidas aos
    % elos interiores ao longo do tempo.
    % MMM - hipermatriz (3 ˆ n ˆ K ) dos momentos aplicados em cada junta
    % ao longo do tempo.
    % MDH - hipermatriz (n ˆ 4 ˆ K ) com as configura¸c˜oes DH ao longo do
    % tempo.
    % MCii - matriz (3 ˆ n) dos centros de massa nas referˆencias de repouso.
    % mm - vetor (n ˆ 1) das massas dos elos
    % Fe - vetor (3 ˆ 1) da for¸ca externa aplicada ao elo terminal
    % Me - vetor (3 ˆ 1) do momento externo aplicado ao elo terminal
    % g - vetor (3 ˆ 1) da acelera¸c˜ao da gravidade

    N = size(MDH, 3);
    FFF = zeros(3, size(MDH, 1), N);
    MMM = FFF;

    for i=1:size(MDH, 3)
        [FF,MM] = RobotStatics(MDH(:,:,i),MCii,mm,Fe,Me,g);
        FFF(:,:,i) = FF;
        MMM(:,:,i) = MM;
    end
end