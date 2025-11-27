.class public Lcom/rtfparserkit/parser/standard/UprHandler;
.super Ljava/lang/Object;
.source "UprHandler.java"

# interfaces
.implements Lcom/rtfparserkit/parser/standard/IParserEventHandler;


# instance fields
.field private complete:Z

.field private final events:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/rtfparserkit/parser/standard/IParserEvent;",
            ">;"
        }
    .end annotation
.end field

.field private groupCount:I

.field private final handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;


# direct methods
.method public constructor <init>(Lcom/rtfparserkit/parser/standard/IParserEventHandler;)V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 189
    iput v0, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->groupCount:I

    .line 191
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    .line 39
    iput-object p1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    return-void
.end method

.method private processCommands()V
    .locals 7

    const/4 v0, 0x0

    .line 111
    :goto_0
    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_9

    .line 115
    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/rtfparserkit/parser/standard/IParserEvent;

    .line 116
    invoke-interface {v1}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v2

    sget-object v3, Lcom/rtfparserkit/parser/standard/ParserEventType;->COMMAND_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    if-ne v2, v3, :cond_8

    .line 118
    check-cast v1, Lcom/rtfparserkit/parser/standard/CommandEvent;

    .line 119
    invoke-virtual {v1}, Lcom/rtfparserkit/parser/standard/CommandEvent;->getCommand()Lcom/rtfparserkit/rtf/Command;

    move-result-object v1

    sget-object v2, Lcom/rtfparserkit/rtf/Command;->ud:Lcom/rtfparserkit/rtf/Command;

    if-ne v1, v2, :cond_8

    .line 127
    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_7

    add-int/lit8 v1, v0, 0x1

    .line 133
    iget-object v2, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rtfparserkit/parser/standard/IParserEvent;

    invoke-interface {v2}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v2

    sget-object v3, Lcom/rtfparserkit/parser/standard/ParserEventType;->GROUP_START_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    if-ne v2, v3, :cond_6

    const/4 v2, 0x2

    add-int/2addr v0, v2

    const/4 v3, 0x1

    move v1, v0

    const/4 v4, 0x1

    .line 143
    :goto_1
    iget-object v5, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ne v1, v5, :cond_0

    goto :goto_3

    .line 148
    :cond_0
    iget-object v5, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/rtfparserkit/parser/standard/IParserEvent;

    .line 149
    sget-object v6, Lcom/rtfparserkit/parser/standard/UprHandler$1;->$SwitchMap$com$rtfparserkit$parser$standard$ParserEventType:[I

    invoke-interface {v5}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v5

    invoke-virtual {v5}, Lcom/rtfparserkit/parser/standard/ParserEventType;->ordinal()I

    move-result v5

    aget v5, v6, v5

    if-eq v5, v3, :cond_2

    if-eq v5, v2, :cond_1

    goto :goto_2

    :cond_1
    add-int/lit8 v4, v4, -0x1

    goto :goto_2

    :cond_2
    add-int/lit8 v4, v4, 0x1

    :goto_2
    if-nez v4, :cond_5

    .line 174
    :goto_3
    iget-object v2, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_4

    :goto_4
    if-gt v0, v1, :cond_3

    .line 181
    iget-object v2, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    iget-object v4, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/rtfparserkit/parser/standard/IParserEvent;

    invoke-interface {v2, v4}, Lcom/rtfparserkit/parser/standard/IParserEventHandler;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 185
    :cond_3
    iput-boolean v3, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->complete:Z

    return-void

    .line 176
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "UPR command: structure not recognised: unable to locate UD group end"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 135
    :cond_6
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "UPR command: expecting group start, found: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/rtfparserkit/parser/standard/IParserEvent;

    invoke-interface {v1}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 129
    :cond_7
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "UPR command: structure not recognised: unable to locate UD command"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 113
    :cond_9
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "UPR command: structure not recognised"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getLastEvent()Lcom/rtfparserkit/parser/standard/IParserEvent;
    .locals 2

    .line 81
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rtfparserkit/parser/standard/IParserEvent;

    return-object v0
.end method

.method public handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V
    .locals 2

    .line 50
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    sget-object v0, Lcom/rtfparserkit/parser/standard/UprHandler$1;->$SwitchMap$com$rtfparserkit$parser$standard$ParserEventType:[I

    invoke-interface {p1}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object p1

    invoke-virtual {p1}, Lcom/rtfparserkit/parser/standard/ParserEventType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 61
    :cond_0
    iget p1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->groupCount:I

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->groupCount:I

    goto :goto_0

    .line 55
    :cond_1
    iget p1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->groupCount:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->groupCount:I

    .line 69
    :goto_0
    iget p1, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->groupCount:I

    if-nez p1, :cond_2

    .line 71
    invoke-direct {p0}, Lcom/rtfparserkit/parser/standard/UprHandler;->processCommands()V

    :cond_2
    return-void
.end method

.method public isComplete()Z
    .locals 1

    .line 99
    iget-boolean v0, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->complete:Z

    return v0
.end method

.method public removeLastEvent()V
    .locals 2

    .line 90
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/UprHandler;->events:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    return-void
.end method
