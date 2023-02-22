# data-bootcamp
# 리눅스
# 데몬 프로세스
#cent os  
#계정 생성
adduser encore
passwd encore  
  
#su > 계정 이동
su encore
#whoami > 현재 로그인 된 계정
whoami  

~ > home directory   
pwd > 현재 위치   

#새로 만든 계정은 시스템에 설치, 수정, 기록 불가  
#계정 logout = exit   

#회사에 갈 경우 git hub 사용 힘듬 > 자체적으로 가상머신에 git 생성해 업무 이용
#git 계정생성
adduser git
passwd git
#git 설치
yum install git -y  
su git  
whoami > pwd
#보안키 설정  
ssh-keygen -t rsa  

ls -al > 숨겨진 파일의 정보들을 보여줘
cat > 보는 거
cd .ssh > ssh 키로 가
cat id_rsa.pub > authorized_keys 
chmod 600 authorized_keys  

git bash 실행 > ssh-keygen -t rsa > cd ~/.ssh > cat id_rsa.pub
vim authorized_keys (키 복붙)
cd ~ > mkdir repos(레포 생성) > cd ./repos(현재 /home/git/repos에 있음)  

git init --bare./ (현재 폴더를 저장소에서 초기화)  
#git 상태 보기 > git status  



