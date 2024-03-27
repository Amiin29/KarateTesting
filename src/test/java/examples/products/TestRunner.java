package examples.products;
import org.junit.jupiter.api.Order;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    @Karate.Test
    Karate Post_Product() {

        return Karate.run("classpath:examples/products/.feature").relativeTo(getClass());
    }
//    @Order(2)
//    @Karate.Test
//    Karate Get_Product() {
//        return Karate.run("classpath:examples/products").relativeTo(getClass());
//    }
}
