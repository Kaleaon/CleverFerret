.class Lcom/rtfparserkit/parser/standard/BinaryBytesEvent;
.super Ljava/lang/Object;
.source "BinaryBytesEvent.java"

# interfaces
.implements Lcom/rtfparserkit/parser/standard/IParserEvent;


# instance fields
.field private final data:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/rtfparserkit/parser/standard/BinaryBytesEvent;->data:[B

    return-void
.end method


# virtual methods
.method public fire(Lcom/rtfparserkit/parser/IRtfListener;)V
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/BinaryBytesEvent;->data:[B

    invoke-interface {p1, v0}, Lcom/rtfparserkit/parser/IRtfListener;->processBinaryBytes([B)V

    return-void
.end method

.method public getType()Lcom/rtfparserkit/parser/standard/ParserEventType;
    .locals 1

    .line 40
    sget-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->BINARY_BYTES_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[BinaryBytesEvent "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/BinaryBytesEvent;->data:[B

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " bytes]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
