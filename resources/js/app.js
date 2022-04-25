import cartItems from "./components/cartItems";

require('./bootstrap');
require('./scripts');

import Vue from 'vue';
import axios from 'axios';

window.Vue = require('vue');
window.axios = require('axios');
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
let token = document.head.querySelector('meta[name="csrf-token"]');

if (token) {
    window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
} else {
    console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
}
import Vuex from 'vuex';
import cartCount from "./components/cartCount";
import Vuelidate from 'vuelidate';

Vue.use(Vuelidate)
Vue.use(Vuex);

import VueMask from 'v-mask'
Vue.use(VueMask);

Vue.component('checkPaymentStatus', require('./components/checkPaymentStatus.vue').default);
Vue.component('constructor', require('./components/constructor.vue').default);
Vue.component('addToCart', require('./components/addToCart.vue').default);
Vue.component('addToCartCake', require('./components/addToCartCake.vue').default);
Vue.component('cartItem', require('./components/cartItem.vue').default);
Vue.component('cartItems', require('./components/cartItems.vue').default);
Vue.component('addToCartSingle', require('./components/addToCartSingle.vue').default);
Vue.component('cartCount', require('./components/cartCount.vue').default);

export const eventBus = new Vue();
export const store = new Vuex.Store({
    state: {
        cartCount: 0,
        total: 0,
        items: null,
        hasCake: false,
    },
    mutations: {
        updateCartCount(state, count) {
            state.cartCount = count;
        },
        updateCartTotal(state, total) {
            state.total = total;
        },
        getCartItems(state, response) {
            state.items = Object.keys(response.data.items).sort().reduce(
                (obj, key) => {
                    obj[key] = response.data.items[key];
                    return obj;
                },
                {}
            );
            state.total = response.data.total;
            state.cartCount = response.data.count;
        },
        checkForCake(state, items) {
            state.hasCake = Object.values(items).filter(item => item.attributes.product_type === 'cake').length > 0;
        },
        updateCartItems(state, items) {
            state.items = items;
        }
    },
    getters: {
        cartCount(state) {
            return state.cartCount
        },
        total(state) {
            return state.total
        },
        items(state) {
            return state.items
        },
        hasCake(state) {
            return state.hasCake
        }
    },
    actions: {
        getCartCount() {
            console.log(cartCount.computed.count());
        },
        getCartContent({commit}) {
            axios.get('/cart/getContent')
                .then((response) => {
                    commit('getCartItems', response);
                    commit('checkForCake', response.data.items);
                });
        },
        getTotal() {
            console.log(cartItems.computed.total());
        }
    },
})

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

let tuttobene = new Vue({
    el: '#tuttobene',
    store,
});

$(document).ready(function () {
    //Всплытие благодарности за 'Оставить заявку'
    $('form.form').submit(function (e) {
        e.preventDefault();
        let self = $(this);
        axios.post('/callback', {
            name: $(self).find('input[name="name"]').val(),
            phone: $(self).find('input[name="phone"]').val(),
            type: $(self).find('input[name="type"]').val(),
        }).then((response) => {
            $('.modal.modal-form').modal('hide');
            $('#form3').modal('show');
            $(self).find('input[name="name"]').val(null);
            $(self).find('input[name="phone"]').val(null);
            $(self).find('input[name="type"]').val(null);
        });
    });
    $('form.contact-form').submit(function (e) {
        e.preventDefault();
        let self = $(this);
        axios.post('/callback', {
            name: $(self).find('input[name="name"]').val(),
            phone: $(self).find('input[name="phone"]').val(),
            type: $(self).find('input[name="type"]').val(),
            comments: $(self).find('textarea[name="comments"]').text()
        }).then((response) => {
            $('.modal.modal-form').modal('hide');
            $('#form3').modal('show');
            $(self).find('input[name="name"]').val(null);
            $(self).find('input[name="phone"]').val(null);
            $(self).find('input[name="type"]').val(null);
            $(self).find('textarea[name="comments"]').text(null);
        });
    });
});
