#include<vector>
#include<utility>
#include<memory>
#include<iostream>
class base {
	public:
	std::string R;
	base(char *val) : R{val} {}
};

class Keeper {
	std::vector<std::pair<std::unique_ptr<std::string>, std::unique_ptr<base>>> vec_ptr;
	std::vector<std::pair<std::string, std::unique_ptr<base>>> vec;
public:
	Keeper()  {}
	~Keeper() {
		for(auto &val : vec_ptr) { 
			//base *p = val.second.release();
			//delete p;
		}
	}
	void addVec(std::unique_ptr<base> R) {
		std::unique_ptr<std::string> ptr = std::make_unique<std::string>(R->R);
		vec_ptr.push_back(std::make_pair(std::move(ptr), std::move(R)));
	}

	void getVec() {
		for(auto &val : vec_ptr) {
			std::cout << *(val.first) << "\n";
		}
	}
};


int main() {
	Keeper k;
	char *names[] = {"fucker", "niggerll", "gay"};
	for(int i=0;i<3;i++) { 
		std::unique_ptr<base> ptr = std::unique_ptr<base>(new base(names[i]));
		k.addVec(std::move(ptr));
	}
	k.getVec();
	//std::unique_ptr<std::string> str = std::make_unique<std::string>(std::string{"fuck"});
}

