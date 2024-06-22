So today I built my own lab. Which is underneath Getting started.
Clickjacked by Nethunter. 
Works well and in the third last photo you can see my almost opaque overlay in the hosted files.

To do this lab you have to have nethunter this can be for android or iPhone there are two ways to do this that works.

1: Getting started:

Lab Begins:

One: find David Bombal on YouTube the link is in FreeU.txt find his Nethunter installation video and follow the steps.
https://youtu.be/KxOGyuGq0Ts?si=a3Mdc-4VtLAgnFB1

Two: My way
Steps For Installation
Install Kali Nethunter Full Version
Install Dependencies In Termux 
pkg update -y && pkg install wget -y

Download Script In HOME 
wget https://raw.githubusercontent.com/rc-chuah/Kali-Nethunter-In-Termux/master/install-nethunter-full-termux

Give Execution Permission 
chmod +x install-nethunter-full-termux

Run Script 
./install-nethunter-full-termux

Now Just Start Kali Nethunter nethunter
nh -r

Credited To Offensive Security

dpkg --configure -a
(this took my phones 4 days Google pixels 3a + 4)
apt update && upgrade -y
(this takes a while)
apt install python3
apt install wget -y

Lab Ends.

2: Nethunter Clickjacked:

Lab Begins:

If you don't have a code editor use GitHub.dev it comes with vsstudio code in the Web browser editor to alter things. 

firstly make the lab directory
mkdir self_hosting

cd self_hosting

then you need to get these files 
wget -u https://github.dev/DeadmanXXXII/5-day-coding-challenge/blame/main/Day%205%20challenge%203.html -O index.html

ls

cat index.html

then
python3 -m http.server 8000

Into a web browser on your phone. 
Make sure not to close the app just change so it runs in the background and go to URL: http://0.0.0.0:8000/ you should see the page. How to make tea.
Once that's correct hit the command below.

Ctrl C

then

wget -u https://github.dev/DeadmanXXXII/5-day-coding-challenge/blame/main/Day%205%20challenge%203.css -O index.css

python3 -m http.server 8000

go back to your web browser https://0.0.0.0:8000/ it should have changed slightly and is now responding on two of the icons and has orange headers.

Ctrl C again to stop the server again.

Now this time you are copying 

wget -u https://github.dev/DeadmanXXXII/attack/blame/main/clickjackingselfhost.html -O index.html

ensure href=http://0.0.0.0:8000/
or.    src=same as above unless it ends with .img or .jpeg that is the hosted picture which you can change for a malicious one at a later lab.
If not
nano index.html
or
vim index.html
and paste that in above if it has quotes put it in quotes.

python3 --version make sure it says over 3.11.0

python3 -m http.server 8000

Go back to your browser and as you scroll through the page and the click me button should appear.

Lab complete.

If the button hasn't appeared then that attack doesn't work with your particular phone OS only change the GitHub link for other clickjacking attacks running any others especially incorrectly can land you in jail.

Change the attacks as mentioned above they all only need the same alterations they will say WhatsApp or GitHub from bug hunting. They say they have defense what'sapp didn't. 
GitHub owned me though no matter how complicated I built it. 
Some just have an opaque overlay, others have just the words click me with an invisible button, some when you touch text, it will redirect you to my website or a .json file you can also host.

Happy hacking hackers.
DeadmanXXXII

This labelled.mp4 as once I'm home I'll be on my computer and will upload videos if I can figure out how to video upload in the GitHub.dev app.



