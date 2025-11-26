.class public interface abstract Lorg/apache/commons/net/DatagramSocketFactory;
.super Ljava/lang/Object;
.source "DatagramSocketFactory.java"


# virtual methods
.method public abstract createDatagramSocket()Ljava/net/DatagramSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation
.end method

.method public abstract createDatagramSocket(I)Ljava/net/DatagramSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation
.end method

.method public abstract createDatagramSocket(ILjava/net/InetAddress;)Ljava/net/DatagramSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation
.end method
