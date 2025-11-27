.class public abstract Lcom/rtfparserkit/converter/text/AbstractTextConverter;
.super Lcom/rtfparserkit/parser/RtfListenerAdaptor;
.source "AbstractTextConverter.java"


# instance fields
.field private currentDestination:Lcom/rtfparserkit/rtf/Command;

.field private final destinationStack:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/rtfparserkit/rtf/Command;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/rtfparserkit/parser/RtfListenerAdaptor;-><init>()V

    .line 116
    sget-object v0, Lcom/rtfparserkit/rtf/Command;->rtf:Lcom/rtfparserkit/rtf/Command;

    iput-object v0, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->currentDestination:Lcom/rtfparserkit/rtf/Command;

    .line 117
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->destinationStack:Ljava/util/Deque;

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

    .line 39
    new-instance v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;

    invoke-direct {v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;-><init>()V

    .line 40
    sget-object v1, Lcom/rtfparserkit/rtf/Command;->rtf:Lcom/rtfparserkit/rtf/Command;

    iput-object v1, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->currentDestination:Lcom/rtfparserkit/rtf/Command;

    .line 41
    invoke-interface {v0, p1, p0}, Lcom/rtfparserkit/parser/IRtfParser;->parse(Lcom/rtfparserkit/parser/IRtfSource;Lcom/rtfparserkit/parser/IRtfListener;)V

    return-void
.end method

.method public processCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V
    .locals 0

    .line 86
    invoke-virtual {p1}, Lcom/rtfparserkit/rtf/Command;->getCommandType()Lcom/rtfparserkit/rtf/CommandType;

    move-result-object p2

    sget-object p3, Lcom/rtfparserkit/rtf/CommandType;->Destination:Lcom/rtfparserkit/rtf/CommandType;

    if-ne p2, p3, :cond_0

    .line 88
    iput-object p1, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->currentDestination:Lcom/rtfparserkit/rtf/Command;

    .line 91
    :cond_0
    sget-object p2, Lcom/rtfparserkit/converter/text/AbstractTextConverter$1;->$SwitchMap$com$rtfparserkit$rtf$Command:[I

    invoke-virtual {p1}, Lcom/rtfparserkit/rtf/Command;->ordinal()I

    move-result p1

    aget p1, p2, p1

    packed-switch p1, :pswitch_data_0

    return-void

    .line 104
    :pswitch_0
    const-string p1, "\t"

    invoke-virtual {p0, p1}, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->processExtractedText(Ljava/lang/String;)V

    return-void

    .line 97
    :pswitch_1
    const-string p1, "\n"

    invoke-virtual {p0, p1}, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->processExtractedText(Ljava/lang/String;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public abstract processExtractedText(Ljava/lang/String;)V
.end method

.method public processGroupEnd()V
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->destinationStack:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rtfparserkit/rtf/Command;

    iput-object v0, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->currentDestination:Lcom/rtfparserkit/rtf/Command;

    return-void
.end method

.method public processGroupStart()V
    .locals 2

    .line 52
    iget-object v0, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->destinationStack:Ljava/util/Deque;

    iget-object v1, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->currentDestination:Lcom/rtfparserkit/rtf/Command;

    invoke-interface {v0, v1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    return-void
.end method

.method public processString(Ljava/lang/String;)V
    .locals 2

    .line 64
    sget-object v0, Lcom/rtfparserkit/converter/text/AbstractTextConverter$1;->$SwitchMap$com$rtfparserkit$rtf$Command:[I

    iget-object v1, p0, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->currentDestination:Lcom/rtfparserkit/rtf/Command;

    invoke-virtual {v1}, Lcom/rtfparserkit/rtf/Command;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    return-void

    .line 70
    :cond_0
    invoke-virtual {p0, p1}, Lcom/rtfparserkit/converter/text/AbstractTextConverter;->processExtractedText(Ljava/lang/String;)V

    return-void
.end method
