
rouge=[1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36]
L=shuffle(rouge)
noir=[2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35]
N=shuffle(noir)
function roue(θ)
    b=S(fill=>:white)*Circle()+S(fill=>:black)U(0.85)*Circle()+S(fill=>:brown)U(0.65)*Circle()
    for k in 0:36 
        b=b+R(2π*k/37)Line([[0,0],[1,0]])
    end 
    b=b+R(2*0*pi/37+0.04)*T(0,0.925)*S(:fontFamily=>"Futura")TextMark(text=0,anchor=:c,fontsize=0.09)
    for k in 1:18
        b=b+S(:fill=>:black)*Slice(rminor=0.85,rmajor=1,θ=(18.25+2*k)*2π/37, ang=2π/37)
        b=b+S(:fill=>:red)*Slice(rminor=0.85,rmajor=1,θ=(18.25+2*k-1)*2π/37, ang=2π/37)
    end
    b=b+S(:fill=>:green)*Slice(rminor=0.85,rmajor=1,θ=18.25*2π/37, ang=2π/37)
    b=b+R(2*0*pi/37+0.04)*T(0,0.925)*S(:fontFamily=>"Futura", :fill=>:darkorange)TextMark(text=0,anchor=:c,fontsize=0.09)
    for k in 1:18
        b=b+R(2*(2*k-1)*pi/37+0.04)*T(0,0.925)*S(:fontFamily=>"Futura", :fill=>:black)TextMark(text=L[k],anchor=:c,fontsize=0.09)
        b=b+R(2*(2*k)*pi/37+0.04)*T(0,0.925)*S(:fontFamily=>"Futura", :fill=>:white)TextMark(text=N[k],anchor=:c,fontsize=0.09)
    end
    for k in 0:36 
        b=b+R(2π*k/37)Line([[0,0],[1,0]])
    end 
    b=b+S(:fill=>:blue)*R(θ+(1/21))*T(0,0.75)*U(0.05)Circle()
    draw(b)
end
function rouecouleur(n)
    if n==0
        println("vert")
    elseif mod(n,2)==1
        println("rouge")
    else
        println("noir")
    end
end
function rouenombre(n)
    if n==0
        println(0)
    elseif mod(n,2)==1
        m=(n+1)/2
        m=convert(Int, m)
        m=L[m]
        println(m)
    else
        m=convert(Int, n/2)
        m=N[m]
        println(m)
    end
end

function rouedessin()
    n=rand(0:36)
    return(roue(2*pi*n/37))
end

function rouefinal()
    n=rand(0:36)
    rouecouleur(n), rouenombre(n)
    return(roue(2*pi*n/37))
end

