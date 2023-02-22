# data-bootcamp
0220 day6
cent os
# ip 주소확인
ip addr

cd == change directory
이동
ls ==파일목록

q! 강제 종료
: 명령어 모드로 이동
wq 쓰고 나가기

vi ifcfg-enp0s8  yes로 변경 (나는 지금 3밖에 없음)



putty (드래그 == 복사, 마우스 오른쪽 == 붙여넣기, 컨트롤씨 == 인터럽트)
enp0s8 ip주소 복사(192:~) 후 host name에 붙여넣기 (혹은 타이핑) 후 오픈
> 허용 > root/패스워드 > ping 8.8.8.8 (구글의 DNS 서버주소)

아이피 드래그 후 메모장에 복붙

vi 신형으로 설치
yum install vim > y > vim a.txt 

visual mode
i > insert 모드(작성모드), esc > 저장(visual mode), : > 명령어모드, 
wq > writequit, q! > quit 강제, w > write
history > 과거 명령어보기, !숫자 > history 안 명령어 실행
pwd > 현재 위치

cd /etc/sysconfig/network-scripts/ 
vim ifcfg-enp0s8
i 누르고 > IPADDR = 192.168.56.101 > esc > :wq > reboot

restart section > root/password > ip addr

# DB 설치
yum install mariadb-server -y

# 시작 demon 등록
# 서버 구동될때 자동으로 실행
# --now는 등록동시에 구동
systemctl enable --now mariadb

systemctl status mariadb > active 구동 확인

# mysql setting 
mysql_secure_installation

#mysql 구동
mysql -uroot -p

#신규 계정 설정+외부 접속 가능하도록
CREATE USER 'encore'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON *.* TO 'encore'@'%';

#리눅스 모드
cd /etc/my.cnf.d/

# DB접속 및 sql 쉽게 할 수 있게 해주는 프로그램
HeidiSQL - 무료, 가볍
cent os ip주소 입력+id/pw 입력

#방화벽 확인
firewall-cmd --state
#방화벽에 3306 포트 허용
firewall-cmd --zone=public --add-port=3306/tcp --permanent
#갱신+방화벽 포트(실제 열려있는) 확인
firewall-cmd --reload
firewall-cmd --list-ports

MYSQL 구조
play 테이블 저장소(파이썬에서 만든거)
CREATE TABLE 테이블 이름 (컬럼, 컬럼형식(수량))
블럭 지정후 컨트롤 에프9 == 이 쿼리만 실행
commit 하면 데이터 들어감
PRIMARY KEY 테이블 안에서 유니크한 값을 잡아줌



-0222 day8
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



