FROM adnrv/texlive-tools
MAINTAINER adin

RUN (mkdir -p `kpsewhich -var-value TEXMFHOME`/tex/latex || true) &&\
    # Get the normal repos
    git clone https://gitlab.com/adin/mcv-academic.git `kpsewhich -var-value TEXMFHOME`/tex/latex/mcv-academic &&\
    git clone https://gitlab.com/adin/tikz-fa.git `kpsewhich -var-value TEXMFHOME`/tex/latex/tikz-fa &&\

    # Get the adn-latex repos
    git clone https://gitlab.com/adn-latex/adn-latex.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adn-latex &&\
    git clone https://gitlab.com/adn-latex/adnamc.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnamc &&\
    git clone https://gitlab.com/adn-latex/codetools.git `kpsewhich -var-value TEXMFHOME`/tex/latex/codetools &&\
    git clone https://gitlab.com/adn-latex/adnlogos.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnlogos &&\
    git clone https://gitlab.com/adn-latex/adnbeamertheme.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnbeamertheme &&\
    git clone https://gitlab.com/adn-latex/adnarticle.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnarticle &&\
    git clone https://gitlab.com/adn-latex/beamertools.git `kpsewhich -var-value TEXMFHOME`/tex/latex/beamertools &&\
    git clone https://gitlab.com/adn-latex/adnexam.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnexam &&\
    git clone https://gitlab.com/adn-latex/adnmemo.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnmemo &&\
    git clone https://gitlab.com/adn-latex/adnreport.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnreport &&\
    git clone https://gitlab.com/adn-latex/adnlanguages.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnlanguages &&\
    git clone https://gitlab.com/adn-latex/adnsurvey.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnsurvey &&\
    git clone https://gitlab.com/adn-latex/adnsyllabus.git `kpsewhich -var-value TEXMFHOME`/tex/latex/adnsyllabus &&\
    
    # Install auto-multiple-choice
    apt-get update -qq &&\
    apt-get install auto-multiple-choice -y &&\

    # Link it in texmf
    (mkdir -p `kpsewhich -var-value TEXMFHOME`/tex/latex/AMC || true) &&\
    ln -s /usr/share/texmf/tex/latex/AMC/automultiplechoice.sty `kpsewhich -var-value TEXMFHOME`/tex/latex/AMC &&\

    # Hash to be sure to find our stuff
    texhash &&\

    # Clean
    apt-get autoclean &&\
    apt-get autoremove &&\
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*
