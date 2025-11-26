.class public abstract Ljavax/xml/stream/XMLInputFactory;
.super Ljava/lang/Object;
.source "XMLInputFactory.java"


# static fields
.field public static final ALLOCATOR:Ljava/lang/String; = "javax.xml.stream.allocator"

.field public static final IS_COALESCING:Ljava/lang/String; = "javax.xml.stream.isCoalescing"

.field public static final IS_NAMESPACE_AWARE:Ljava/lang/String; = "javax.xml.stream.isNamespaceAware"

.field public static final IS_REPLACING_ENTITY_REFERENCES:Ljava/lang/String; = "javax.xml.stream.isReplacingEntityReferences"

.field public static final IS_SUPPORTING_EXTERNAL_ENTITIES:Ljava/lang/String; = "javax.xml.stream.isSupportingExternalEntities"

.field public static final IS_VALIDATING:Ljava/lang/String; = "javax.xml.stream.isValidating"

.field public static final REPORTER:Ljava/lang/String; = "javax.xml.stream.reporter"

.field public static final RESOLVER:Ljava/lang/String; = "javax.xml.stream.resolver"

.field public static final SUPPORT_DTD:Ljava/lang/String; = "javax.xml.stream.supportDTD"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newInstance()Ljavax/xml/stream/XMLInputFactory;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/FactoryConfigurationError;
        }
    .end annotation

    .line 136
    const-string v0, "javax.xml.stream.XMLInputFactory"

    const-string v1, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v0, v1}, Ljavax/xml/stream/FactoryFinder;->find(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/stream/XMLInputFactory;

    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljavax/xml/stream/XMLInputFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/FactoryConfigurationError;
        }
    .end annotation

    .line 155
    const-string v0, "com.bea.xml.stream.MXParserFactory"

    invoke-static {p0, v0, p1}, Ljavax/xml/stream/FactoryFinder;->find(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljavax/xml/stream/XMLInputFactory;

    return-object p0
.end method


# virtual methods
.method public abstract createFilteredReader(Ljavax/xml/stream/XMLEventReader;Ljavax/xml/stream/EventFilter;)Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createFilteredReader(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/StreamFilter;)Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLEventReader(Ljava/io/InputStream;)Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLEventReader(Ljava/io/InputStream;Ljava/lang/String;)Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLEventReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLEventReader(Ljava/lang/String;Ljava/io/InputStream;)Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLEventReader(Ljava/lang/String;Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLEventReader(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLEventReader(Ljavax/xml/transform/Source;)Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLStreamReader(Ljava/io/InputStream;)Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLStreamReader(Ljava/io/InputStream;Ljava/lang/String;)Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLStreamReader(Ljava/lang/String;Ljava/io/InputStream;)Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLStreamReader(Ljava/lang/String;Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract createXMLStreamReader(Ljavax/xml/transform/Source;)Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public abstract getEventAllocator()Ljavax/xml/stream/util/XMLEventAllocator;
.end method

.method public abstract getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract getXMLReporter()Ljavax/xml/stream/XMLReporter;
.end method

.method public abstract getXMLResolver()Ljavax/xml/stream/XMLResolver;
.end method

.method public abstract isPropertySupported(Ljava/lang/String;)Z
.end method

.method public abstract setEventAllocator(Ljavax/xml/stream/util/XMLEventAllocator;)V
.end method

.method public abstract setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract setXMLReporter(Ljavax/xml/stream/XMLReporter;)V
.end method

.method public abstract setXMLResolver(Ljavax/xml/stream/XMLResolver;)V
.end method
