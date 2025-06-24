#include "bulbcontroller.h"
[[nodiscard("error")]]bool Is_Warm_Color(const uint64_t& r,const uint64_t& g,const uint64_t& b)noexcept(false){
    return r>=150 && b <=100 && g<=r;
}

BulbController::BulbController(QObject*parent, QString Port,QString Lan_Port)
    : QObject(parent),
    bulb(Port,Lan_Port)
{}


void BulbController::Turn_on() {
    bulb.SetPower(true,"smooth",1500);
}

void BulbController::Turn_off(){
    bulb.SetPower(false,"smooth",1500);
}

void BulbController::Set_RGB(const uint64_t&r,const uint64_t&g,const uint64_t&b){
    bulb.SetRGB(r,g,b,"smooth",1500);
}

void BulbController::Set_Temperature(const uint64_t& Temperature){
    bulb.SetColorTemperature(Temperature,"smooth",1500);
}

void BulbController::Set_Brightness(const uint64_t& Brightness){
    bulb.SetBrightness(Brightness,"smooth",1500);
}

void BulbController::Horizon_mode(){
    while(true){
        uint64_t r = rand()%255;
        uint64_t g = rand()%255;
        uint64_t b = rand()%255;
        if(Is_Warm_Color(r,g,b)){
            bulb.SetRGB(r,g,b,"smooth",1500);
        }
    }
}
void BulbController::Set_Power(bool flag){
    bulb.SetPower(flag,"smooth",1500);
}

