.class public Lcom/rtfparserkit/converter/text/StringTextConverter;
.super Lcom/rtfparserkit/converter/text/AbstractTextConverter;
.source "StringTextConverter.java"


# instance fields
.field private buffer:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/rtfparserkit/converter/text/AbstractTextConverter;-><init>()V

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/rtfparserkit/converter/text/StringTextConverter;->buffer:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public convert(Lcom/rtfparserkit/parser/IRtfSource;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    iget-object v0, p0, Lcom/rtfparserkit/converter/text/StringTextConverter;->buffer:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 34
    invoke-super {p0, p1}, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->convert(Lcom/rtfparserkit/parser/IRtfSource;)V

    return-void
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/rtfparserkit/converter/text/StringTextConverter;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public processExtractedText(Ljava/lang/String;)V
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/rtfparserkit/converter/text/StringTextConverter;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method
