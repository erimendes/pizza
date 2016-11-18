// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.pizzashop.domain;

import com.springsource.roo.pizzashop.domain.BaseDataOnDemand;
import com.springsource.roo.pizzashop.domain.Pizza;
import com.springsource.roo.pizzashop.domain.PizzaDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PizzaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PizzaDataOnDemand: @Component;
    
    private Random PizzaDataOnDemand.rnd = new SecureRandom();
    
    private List<Pizza> PizzaDataOnDemand.data;
    
    @Autowired
    BaseDataOnDemand PizzaDataOnDemand.baseDataOnDemand;
    
    public Pizza PizzaDataOnDemand.getNewTransientPizza(int index) {
        Pizza obj = new Pizza();
        setName(obj, index);
        setPrice(obj, index);
        return obj;
    }
    
    public void PizzaDataOnDemand.setName(Pizza obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void PizzaDataOnDemand.setPrice(Pizza obj, int index) {
        Float price = new Integer(index).floatValue();
        obj.setPrice(price);
    }
    
    public Pizza PizzaDataOnDemand.getSpecificPizza(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Pizza obj = data.get(index);
        Long id = obj.getId();
        return Pizza.findPizza(id);
    }
    
    public Pizza PizzaDataOnDemand.getRandomPizza() {
        init();
        Pizza obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Pizza.findPizza(id);
    }
    
    public boolean PizzaDataOnDemand.modifyPizza(Pizza obj) {
        return false;
    }
    
    public void PizzaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Pizza.findPizzaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Pizza' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Pizza>();
        for (int i = 0; i < 10; i++) {
            Pizza obj = getNewTransientPizza(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
