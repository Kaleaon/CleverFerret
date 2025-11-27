.class public interface abstract Ljavax/xml/stream/util/XMLEventAllocator;
.super Ljava/lang/Object;
.source "XMLEventAllocator.java"


# virtual methods
.method public abstract allocate(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/XMLEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract allocate(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/util/XMLEventConsumer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract newInstance()Ljavax/xml/stream/util/XMLEventAllocator;
.end method
