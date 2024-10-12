// config.h
#ifndef CONFIG_H
#define CONFIG_H

#define PORT 8000

enum MHD_Result answer_to_connection(void *cls, struct MHD_Connection *connection,
                                     const char *url, const char *method,
                                     const char *version, const char *upload_data,
                                     size_t *upload_data_size, void **con_cls);

#endif // CONFIG_H
