.class Lcom/rtfparserkit/parser/standard/DocumentStartEvent;
.super Ljava/lang/Object;
.source "DocumentStartEvent.java"

# interfaces
.implements Lcom/rtfparserkit/parser/standard/IParserEvent;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fire(Lcom/rtfparserkit/parser/IRtfListener;)V
    .locals 0

    .line 32
    invoke-interface {p1}, Lcom/rtfparserkit/parser/IRtfListener;->processDocumentStart()V

    return-void
.end method

.method public getType()Lcom/rtfparserkit/parser/standard/ParserEventType;
    .locals 1

    .line 41
    sget-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->DOCUMENT_START_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 47
    const-string v0, "[DocumentStartEvent]"

    return-object v0
.end method
