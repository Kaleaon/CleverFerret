.class public Ljavax/xml/stream/util/EventReaderDelegate;
.super Ljava/lang/Object;
.source "EventReaderDelegate.java"

# interfaces
.implements Ljavax/xml/stream/XMLEventReader;


# instance fields
.field private reader:Ljavax/xml/stream/XMLEventReader;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljavax/xml/stream/XMLEventReader;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .line 81
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->close()V

    return-void
.end method

.method public getElementText()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .line 87
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->getElementText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Ljavax/xml/stream/XMLEventReader;
    .locals 1

    .line 54
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 99
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLEventReader;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public hasNext()Z
    .locals 1

    .line 69
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 1

    .line 64
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public nextEvent()Ljavax/xml/stream/events/XMLEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .line 60
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    return-object v0
.end method

.method public nextTag()Ljavax/xml/stream/events/XMLEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .line 93
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->nextTag()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    return-object v0
.end method

.method public peek()Ljavax/xml/stream/events/XMLEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->peek()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 103
    iget-object v0, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->remove()V

    return-void
.end method

.method public setParent(Ljavax/xml/stream/XMLEventReader;)V
    .locals 0

    .line 46
    iput-object p1, p0, Ljavax/xml/stream/util/EventReaderDelegate;->reader:Ljavax/xml/stream/XMLEventReader;

    return-void
.end method
