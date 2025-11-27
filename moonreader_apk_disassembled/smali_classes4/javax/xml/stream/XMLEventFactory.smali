.class public abstract Ljavax/xml/stream/XMLEventFactory;
.super Ljava/lang/Object;
.source "XMLEventFactory.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newInstance()Ljavax/xml/stream/XMLEventFactory;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/FactoryConfigurationError;
        }
    .end annotation

    .line 30
    const-string v0, "javax.xml.stream.XMLEventFactory"

    const-string v1, "com.bea.xml.stream.EventFactory"

    invoke-static {v0, v1}, Ljavax/xml/stream/FactoryFinder;->find(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/stream/XMLEventFactory;

    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljavax/xml/stream/XMLEventFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/FactoryConfigurationError;
        }
    .end annotation

    .line 48
    const-string v0, "com.bea.xml.stream.EventFactory"

    invoke-static {p0, v0, p1}, Ljavax/xml/stream/FactoryFinder;->find(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljavax/xml/stream/XMLEventFactory;

    return-object p0
.end method


# virtual methods
.method public abstract createAttribute(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/Attribute;
.end method

.method public abstract createAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/Attribute;
.end method

.method public abstract createAttribute(Ljavax/xml/namespace/QName;Ljava/lang/String;)Ljavax/xml/stream/events/Attribute;
.end method

.method public abstract createCData(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;
.end method

.method public abstract createCharacters(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;
.end method

.method public abstract createComment(Ljava/lang/String;)Ljavax/xml/stream/events/Comment;
.end method

.method public abstract createDTD(Ljava/lang/String;)Ljavax/xml/stream/events/DTD;
.end method

.method public abstract createEndDocument()Ljavax/xml/stream/events/EndDocument;
.end method

.method public abstract createEndElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/EndElement;
.end method

.method public abstract createEndElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Ljavax/xml/stream/events/EndElement;
.end method

.method public abstract createEndElement(Ljavax/xml/namespace/QName;Ljava/util/Iterator;)Ljavax/xml/stream/events/EndElement;
.end method

.method public abstract createEntityReference(Ljava/lang/String;Ljavax/xml/stream/events/EntityDeclaration;)Ljavax/xml/stream/events/EntityReference;
.end method

.method public abstract createIgnorableSpace(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;
.end method

.method public abstract createNamespace(Ljava/lang/String;)Ljavax/xml/stream/events/Namespace;
.end method

.method public abstract createNamespace(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/Namespace;
.end method

.method public abstract createProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/ProcessingInstruction;
.end method

.method public abstract createSpace(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;
.end method

.method public abstract createStartDocument()Ljavax/xml/stream/events/StartDocument;
.end method

.method public abstract createStartDocument(Ljava/lang/String;)Ljavax/xml/stream/events/StartDocument;
.end method

.method public abstract createStartDocument(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/StartDocument;
.end method

.method public abstract createStartDocument(Ljava/lang/String;Ljava/lang/String;Z)Ljavax/xml/stream/events/StartDocument;
.end method

.method public abstract createStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/StartElement;
.end method

.method public abstract createStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;Ljava/util/Iterator;)Ljavax/xml/stream/events/StartElement;
.end method

.method public abstract createStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;Ljava/util/Iterator;Ljavax/xml/namespace/NamespaceContext;)Ljavax/xml/stream/events/StartElement;
.end method

.method public abstract createStartElement(Ljavax/xml/namespace/QName;Ljava/util/Iterator;Ljava/util/Iterator;)Ljavax/xml/stream/events/StartElement;
.end method

.method public abstract setLocation(Ljavax/xml/stream/Location;)V
.end method
