b = input("insert a matrix");
c = input("insert a conculusion matrix");

a = [b c];
[m,n] = size(a);

for i=1:m-1
    for j=i+1:m
        if (a(i,i) == 0) %eğer koşegen 0 ise satırları yer değiştiriyoruz
            temp = a(i,:);
            a(i,:) = a(j,:);
            a(j,:) = temp;
        end
    end
    
    for j=i+1:m
        a(j,:) = (a(j,i)/a(i,i))*(-a(i,:))+a(j,:); %pivotun bir altındaki elemanı pivota bölüp çıkan sonucu pivotun olduğu satırla çarpıyoruz ve sonra pivot elemanın altındaki satırı pivot elemanın satırından çıkarıyoruz yani üst üçgen yapıyoruz                 
    end
end

for i=m:-1:2
    for j=i-1:-1:1
        a(j,:) = (a(j,i)/a(i,i))*a(i,:)-a(j,:); %yukarıdaki işlemin aynısını yapıyoruz ama tersten çünkü bu sefer matrisi alt üçgen yapmamız lazım yani köşegen değerleri hariç bütün matris değerlerini kurallı bir şekilde 0 yapıyoruz
    end
end

x = zeros(1,n-1); %köklerin yer alacağı bir matrix tanımlıyoruz

for i=1:m %sonuç matrisindeki elemanları sırayla köşegenlere bölüyoruz ve çıkan sonucu x matrisine ekliyoruz
    z = a(i,i);
    y = a(i,n);    
    x(i) = y/z;
end

a %gauss jordan metou uygulanmış matrisin son halini yazdırıyoruz
x' %sonuç matrisinin transpozunu alıp vektöre çeviriyoruz ve bitti
