.class public Lcom/rtfparserkit/utils/RtfDumpListener;
.super Ljava/lang/Object;
.source "RtfDumpListener.java"

# interfaces
.implements Lcom/rtfparserkit/parser/IRtfListener;


# instance fields
.field private final writer:Ljavax/xml/stream/XMLStreamWriter;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {}, Ljavax/xml/stream/XMLOutputFactory;->newInstance()Ljavax/xml/stream/XMLOutputFactory;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, p1, v1}, Ljavax/xml/stream/XMLOutputFactory;->createXMLStreamWriter(Ljava/io/OutputStream;Ljava/lang/String;)Ljavax/xml/stream/XMLStreamWriter;

    move-result-object p1

    iput-object p1, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    return-void
.end method


# virtual methods
.method public processBinaryBytes([B)V
    .locals 4

    .line 109
    :try_start_0
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string v1, "bytes"

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;)V

    .line 110
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-byte v2, p1, v1

    .line 112
    iget-object v3, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 114
    :cond_0
    iget-object p1, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V
    :try_end_0
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 119
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public processCharacterBytes([B)V
    .locals 2

    .line 87
    :try_start_0
    array-length v0, p1

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string v1, "chars"

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([B)V

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    .line 91
    iget-object p1, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V
    :try_end_0
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p1

    .line 97
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public processCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V
    .locals 2

    .line 165
    :try_start_0
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string v1, "command"

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeEmptyElement(Ljava/lang/String;)V

    .line 166
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string v1, "name"

    invoke-virtual {p1}, Lcom/rtfparserkit/rtf/Command;->getCommandName()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    .line 170
    iget-object p1, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string p3, "parameter"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p3, p2}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p4, :cond_1

    .line 175
    iget-object p1, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string p2, "optional"

    const-string p3, "true"

    invoke-interface {p1, p2, p3}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception p1

    .line 180
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public processDocumentEnd()V
    .locals 2

    .line 69
    :try_start_0
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V

    .line 70
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->writeEndDocument()V
    :try_end_0
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 74
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public processDocumentStart()V
    .locals 3

    .line 52
    :try_start_0
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string v1, "UTF-8"

    const-string v2, "1.0"

    invoke-interface {v0, v1, v2}, Ljavax/xml/stream/XMLStreamWriter;->writeStartDocument(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string v1, "rtf"

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 57
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public processGroupEnd()V
    .locals 2

    .line 148
    :try_start_0
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V
    :try_end_0
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 153
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public processGroupStart()V
    .locals 2

    .line 131
    :try_start_0
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string v1, "group"

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 136
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public processString(Ljava/lang/String;)V
    .locals 2

    .line 192
    :try_start_0
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    const-string v1, "chars"

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;)V

    .line 193
    iget-object v0, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    .line 194
    iget-object p1, p0, Lcom/rtfparserkit/utils/RtfDumpListener;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V
    :try_end_0
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 198
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method
