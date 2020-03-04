normalize <- function(x){((x-min(x))/(max(x)-min(x)))}

toy_data <- clusterlab::clusterlab(centers = 3,
                                   r = 2,
                                   numbervec = c(5, 5, 5),
                                   sdvec = sample(1:3, 3),
                                   alphas = sample(1:3, 3),
                                   features = 2,
                                   seed = 2020)
toy_data <- as_tibble(t(toy_data$synthetic_data)) %>%
  mutate(cluster = as.factor(toy_data$identity_matrix$cluster)) %>%
  mutate_if(is.numeric, normalize)

ggplot(toy_data, aes(V1, V2, color = cluster)) +
  geom_point()

usethis::use_data(toy_data, overwrite = TRUE, )


set.seed(2020)
toy_data1 <- tibble(V1 = sample(1:10, 5),
                    V2 = sample(1:10, 5))
set.seed(2020)
toy_data2 <- tibble(V1 = sample(1:10, 5),
                    V2 = sample(1:10, 5),
                    V3 = sample(1:10, 5))
set.seed(2020)
toy_data3 <- tibble(V1 = sample(1:10, 5),
                    V2 = sample(1:10, 5),
                    V3 = sample(1:10, 5),
                    V4 = sample(1:10, 5))
