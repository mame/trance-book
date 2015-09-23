#ifndef _LINUX_OHS900_HCD_H
#define _LINUX_OHS900_HCD_H


struct ohs900_platform_data {
    unsigned can_wakeup:1;
    u8 potpg;
    u8 power;
    void (*port_power)(struct device *dev, int is_on);
    void (*reset) (struct device *dev);    
};


#endif /* _LINUX_OHS900_HCD */
