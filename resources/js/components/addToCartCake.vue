<template>
    <div
        :productType="productType"
        :productId="productId"
        :price="productPrice"
        :minWeight="minWeight"
        :maxWeight="maxWeight"
        class="col-lg-6 col-xl-4">
        <div class="row tovar_inner_1 align-items-center">
            <div class="col-6 text-start">
                <span>1 кг</span>
                {{ formatPrice(productPrice) }} тг
            </div>
            <div class="col-6 text-end">
                {{ formatPrice(productTotal) }} тг
            </div>
        </div>
        <div class="row tovar_inner_3 align-items-center justify-content-center">
            <div class="col-6 col-md-4">
                <select v-model="weightKg" @change="calculate">
                    <option :value="kilo" v-for="kilo in kilogramms">{{ kilo }} кг</option>
                </select>
            </div>
            <div class="col-6 col-md-4">
                <select v-model="weightGr" @change="calculate">
                    <option :value="i" v-for="i in gramms">{{ i }} гр</option>
                </select>
            </div>
            <div class="col-6 col-md-4 text-center">
                <div class="tovar_inner_2">
                    <button type="button" @click="minusCart">-</button>
                    <input type="number" min="1" max="100" :value="count" readonly class="raz">
                    <button type="button" @click="plusCart">+</button>
                </div>
            </div>
            <div class="col-12">
                <input type="text" v-model="cakeText" placeholder="Надпись на торте ...">
            </div>
            <div class="col-12 text-center">
                <a href="#" @click.prevent="addToCart" class="add_cart_2">Положить в корзину</a>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    props: ['productId', 'productType', 'productPrice', 'minWeight', 'maxWeight'],
    data() {
        return {
            count: 1,
            cakeText: '',
            productTotal: this.productPrice * this.minWeight,
            weightKg: parseInt(this.minWeight),
            weightGr: (this.minWeight * 1000) - (parseInt(this.minWeight) * 1000),
            gramms: [0, 100, 200, 300, 400, 500, 600, 700, 800, 900],
            kilogramms: this.maxWeight.length > 0 ? parseInt(this.maxWeight) : 10,
        }
    },
    created() {
        this.calculate();
    },
    methods: {
        minusCart() {
            if (this.count > 0)
                this.count--;
            this.calculate();
        },
        plusCart() {
            this.count++;
            this.calculate();
        },
        calculate() {
            let totalWeight = parseFloat((this.weightKg*1000 + this.weightGr)/1000);
            let totalGramms = [0, 100, 200, 300, 400, 500, 600, 700, 800, 900];
            let maxWeight =  this.maxWeight.length > 0 ? this.maxWeight : 10;
            if (parseInt(totalWeight) === parseInt(maxWeight)) {
                this.gramms = totalGramms.filter((gram) => {
                    return gram <= (maxWeight * 1000) - (parseInt(maxWeight) * 1000)
                });
            } else if (parseInt(totalWeight) === parseInt(this.minWeight)) {
                this.gramms = totalGramms.filter((gram) => {
                    return gram >= (this.minWeight * 1000) - (parseInt(this.minWeight) * 1000)
                });
            } else {
                this.gramms = totalGramms;
            }


            if (totalWeight >= this.minWeight && totalWeight <= maxWeight) {
                this.productTotal = this.count * (totalWeight * this.productPrice);
            } else {

                alert(`Минимальный вес торта - ${this.minWeight} кг;\nМаксимальный вес торта - ${maxWeight} кг;`);

                if (parseInt(totalWeight) <= parseInt(this.minWeight)){
                    this.productTotal = this.count * (parseFloat(this.minWeight) * this.productPrice);
                    this.weightKg = parseInt(this.minWeight);
                    this.weightGr = (this.minWeight * 1000) - (parseInt(this.minWeight) * 1000);
                }else {
                    this.productTotal = this.count * (parseFloat(maxWeight) * this.productPrice);
                    this.weightKg = parseInt(maxWeight);
                    this.weightGr = (maxWeight * 1000) - (parseInt(maxWeight) * 1000);
                }

            }
        },
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
        },
        addToCart() {
            let self = this;
            let totalWeight = parseFloat(this.weightKg + (this.weightGr / 1000));

            axios.post('/cart/add', {
                productId: this.productId,
                productType: this.productType,
                weight: totalWeight,
                cakeText: this.cakeText,
                qty: this.count,
                price: this.productTotal
            })
                .then((response) => {
                    self.btnClass = 'added';
                    self.$store.commit('updateCartCount', response.data.count);
                    self.$store.commit('updateCartTotal', response.data.total);
                    self.$store.commit('updateCartItems', response.data.items);
                });
        }

    },
};
</script>
