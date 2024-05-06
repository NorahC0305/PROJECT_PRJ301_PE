/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Currency;

import java.io.Serializable;

/**
 *
 * @author Norah
 */
public class CurrencyDTO implements Serializable {

    private String code;
    private String name;
    private String description;
    private double rate;

    public CurrencyDTO() {
    }

    public CurrencyDTO(String code, String name, String description, double rate) {
        this.code = code;
        this.name = name;
        this.description = description;
        this.rate = rate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    @Override
    public String toString() {
        return "CurrencyDTO{" + "code=" + code + ", name=" + name + ", description=" + description + ", rate=" + rate + '}';
    }

}
