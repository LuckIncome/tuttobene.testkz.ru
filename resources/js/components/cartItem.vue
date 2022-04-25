<template>
    <div class="row cart_row align-items-center">
        <div class="col-4 col-md-1 cart_image">
            <a :href="'associatedModel' in item ? item.associatedModel.link : null">
                <picture>
                    <img :src="`${item.attributes.image}`" :alt="item.attributes.title">
                </picture>
            </a>
        </div>
        <div class="col-8 col-md-3 offset-md-1 cart_name">
            <a :href="'associatedModel' in item ? item.associatedModel.link : null">{{ item.attributes.title }}</a>
            <div class="clearfix"></div>
            {{item.category}}
        </div>
        <div class="col-3 offset-4 offset-md-0 col-md-2 text-md-center cart_ves" v-html="item.attributes.excerpt">

        </div>
        <div class="col-5 col-md-2 text-center">
            <div class="tovar_inner_2">
                <button type="button" @click.prevent="minusCart">-</button>
                <input type="number" min="1" max="100" :value="item.quantity" readonly class="raz">
                <button type="button" @click.prevent="plusCart">+</button>
            </div>
        </div>
        <div class="col-6 offset-4 offset-md-0 col-md-2 cart_cena text-md-center">
            {{ formatPrice(item.price*item.quantity) }} тг
        </div>
        <div class="col-2 col-md-1 text-start cart_delete">
            <a href="#" @click.prevent="removeItem"><img src="/img/delete.svg" alt=""></a>
        </div>
    </div>
</template>

<script>
import {store} from '../app';

export default {
    props: ['item'],
    methods: {
        formatPrice(value) {
            let val = (value/1).toFixed(0).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
        },
        minusCart() {
            if (this.item.quantity > 0)
                this.item.quantity--;
            if (this.item.quantity <= 0)
                this.removeItem();

            this.updateCart();
        },
        plusCart() {
            this.item.quantity++;
            this.updateCart();
        },
        updateCart() {
            let self = this;
            axios.post('/cart/update',{productId: this.item.id, qty:this.item.quantity,'inCartAction': 1})
                .then((response)=>{
                    self.$store.commit('updateCartCount',response.data.count);
                    self.$store.commit('updateCartTotal',response.data.total);
                    let items = Object.keys(response.data.items).sort().reduce(
                        (obj, key) => {
                            obj[key] = response.data.items[key];
                            return obj;
                        },
                        {}
                    );
                    self.$store.commit('updateCartItems',items);
                    self.$store.commit("checkForCake", items);

                });
        },
        removeItem(){
            let self = this;
            axios.post('/cart/remove',{productId: this.item.id})
                .then((response)=>{
                    self.$store.commit('updateCartCount',response.data.count);
                    self.$store.commit('updateCartTotal',response.data.total);
                    let items = Object.keys(response.data.items).sort().reduce(
                        (obj, key) => {
                            obj[key] = response.data.items[key];
                            return obj;
                        },
                        {}
                    );
                    self.$store.commit('updateCartItems',items);
                    self.$store.commit("checkForCake", items);
                });
        }
    },
};
</script>
<style>

</style>
