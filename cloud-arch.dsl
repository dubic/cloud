workspace {

    model {
        user = person User
        cloud = softwareSystem "Cloud" {
            gateway = container "API gateway"
            auth = container "Authentication service" "authentication & authorization"
            orders = container "Orders service" "Orders management"
            payments = container "Payments service"
        }
        
        user -> gateway "orders & pays" "http"
        gateway -> auth "authenticates request" "REST"
        gateway -> payments "pay for order" "REST"
        gateway -> orders "make an order" "REST"
        payments -> orders "order payment completed" "kafka"
    }

    views {
        systemContext cloud {
            include *
            autolayout lr
        }

        container cloud {
            include *
            autolayout lr
        }

        theme default
    }

}