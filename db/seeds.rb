for i in 0..10
Gist.create(snippet:'
# Output "I love Ruby"
say = "I love Ruby"
puts say
# Output "I *LOVE* RUBY"
say["love"] = "*love*"
puts say.upcase
# Output "I *love* Ruby"
# five times
5.times { puts say }
', lang:'ruby',description:'I love Ruby '+i.to_s)

Gist.create(snippet:'
import javax.swing.JOptionPane;
public class HelloWorld {
public static void main(String[] args) {
JOptionPane.showMessageDialog(null, \"Hello, world!\");
}
}
', lang:'java',description:'I love Java '+i.to_s)

Gist.create(snippet:'
class Emulator:
 
def __call__(self, x):
        print "Ten Emulator", x
 
def __getitem__(self, key):
return str(key) + "Emulator"
 
e = Emulator()
e(abc)
e(123)
print e[def]
print e[456]
', lang:'python',description:'I love Python '+i.to_s)

Gist.create(snippet:'
mov ax, 0D625h
mov es, ax       
mov al, 24
mov ah, 0        
int 21h          
', lang:'DASM16',description:'I love Asm '+i.to_s)

Gist.create(snippet:'
<script type="text/javascript">
/* <![CDATA[ */
 alert(12 > 6);
/*]]> */</script>
', lang:'js',description:'I love Javascript '+i.to_s)
end

for i in 0..10
Post.create(content:'Aplikacja została wdrożona na shellycloud',description:'Post '+i.to_s)
Post.create(content:'Aplikacja została stworzona przez zespół CŁOP',description:'Post '+i.to_s)
Post.create(content:'Zyczymy milego dnia',description:'Post '+i.to_s)

end

