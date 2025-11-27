.class Lcom/rtfparserkit/parser/standard/DefaultEventHandler;
.super Ljava/lang/Object;
.source "DefaultEventHandler.java"

# interfaces
.implements Lcom/rtfparserkit/parser/standard/IParserEventHandler;


# static fields
.field private static final MAX_EVENTS:I = 0x5


# instance fields
.field private final events:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/rtfparserkit/parser/standard/IParserEvent;",
            ">;"
        }
    .end annotation
.end field

.field private final listener:Lcom/rtfparserkit/parser/IRtfListener;


# direct methods
.method public constructor <init>(Lcom/rtfparserkit/parser/IRtfListener;)V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    .line 36
    iput-object p1, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    return-void
.end method

.method private flushEvents()V
    .locals 3

    .line 116
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/rtfparserkit/parser/standard/IParserEvent;

    .line 118
    iget-object v2, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    invoke-interface {v1, v2}, Lcom/rtfparserkit/parser/standard/IParserEvent;->fire(Lcom/rtfparserkit/parser/IRtfListener;)V

    goto :goto_0

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->clear()V

    return-void
.end method

.method private mergeStringEvents(Lcom/rtfparserkit/parser/standard/StringEvent;)Lcom/rtfparserkit/parser/standard/IParserEvent;
    .locals 3

    .line 106
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rtfparserkit/parser/standard/StringEvent;

    .line 107
    new-instance v1, Lcom/rtfparserkit/parser/standard/StringEvent;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/rtfparserkit/parser/standard/StringEvent;->getString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/rtfparserkit/parser/standard/StringEvent;->getString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/rtfparserkit/parser/standard/StringEvent;-><init>(Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public getLastEvent()Lcom/rtfparserkit/parser/standard/IParserEvent;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rtfparserkit/parser/standard/IParserEvent;

    return-object v0
.end method

.method public handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V
    .locals 2

    .line 50
    invoke-interface {p1}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v0

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->DOCUMENT_END_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    if-ne v0, v1, :cond_0

    .line 52
    invoke-direct {p0}, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->flushEvents()V

    .line 53
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    invoke-interface {p1, v0}, Lcom/rtfparserkit/parser/standard/IParserEvent;->fire(Lcom/rtfparserkit/parser/IRtfListener;)V

    return-void

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->peekLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rtfparserkit/parser/standard/IParserEvent;

    if-eqz v0, :cond_1

    .line 58
    invoke-interface {v0}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v0

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->STRING_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    if-ne v0, v1, :cond_1

    invoke-interface {p1}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v0

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->STRING_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    if-ne v0, v1, :cond_1

    .line 60
    check-cast p1, Lcom/rtfparserkit/parser/standard/StringEvent;

    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->mergeStringEvents(Lcom/rtfparserkit/parser/standard/StringEvent;)Lcom/rtfparserkit/parser/standard/IParserEvent;

    move-result-object p1

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 65
    iget-object p1, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {p1}, Ljava/util/Deque;->size()I

    move-result p1

    const/4 v0, 0x5

    if-le p1, v0, :cond_2

    .line 67
    iget-object p1, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {p1}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/rtfparserkit/parser/standard/IParserEvent;

    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    invoke-interface {p1, v0}, Lcom/rtfparserkit/parser/standard/IParserEvent;->fire(Lcom/rtfparserkit/parser/IRtfListener;)V

    :cond_2
    return-void
.end method

.method public isComplete()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public removeLastEvent()V
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;->events:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->removeLast()Ljava/lang/Object;

    return-void
.end method
