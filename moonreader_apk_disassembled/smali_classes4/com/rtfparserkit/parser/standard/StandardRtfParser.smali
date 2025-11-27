.class public Lcom/rtfparserkit/parser/standard/StandardRtfParser;
.super Ljava/lang/Object;
.source "StandardRtfParser.java"

# interfaces
.implements Lcom/rtfparserkit/parser/IRtfParser;
.implements Lcom/rtfparserkit/parser/IRtfListener;


# static fields
.field private static final DOCUMENT_END:Lcom/rtfparserkit/parser/standard/IParserEvent;

.field private static final DOCUMENT_START:Lcom/rtfparserkit/parser/standard/IParserEvent;

.field private static final GROUP_END:Lcom/rtfparserkit/parser/standard/IParserEvent;

.field private static final GROUP_START:Lcom/rtfparserkit/parser/standard/IParserEvent;


# instance fields
.field private handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

.field private final handlerStack:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/rtfparserkit/parser/standard/IParserEventHandler;",
            ">;"
        }
    .end annotation
.end field

.field private m_fontEncodings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private skipBytes:I

.field private final stack:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/rtfparserkit/parser/standard/ParserState;",
            ">;"
        }
    .end annotation
.end field

.field private state:Lcom/rtfparserkit/parser/standard/ParserState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 438
    new-instance v0, Lcom/rtfparserkit/parser/standard/DocumentStartEvent;

    invoke-direct {v0}, Lcom/rtfparserkit/parser/standard/DocumentStartEvent;-><init>()V

    sput-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->DOCUMENT_START:Lcom/rtfparserkit/parser/standard/IParserEvent;

    .line 439
    new-instance v0, Lcom/rtfparserkit/parser/standard/DocumentEndEvent;

    invoke-direct {v0}, Lcom/rtfparserkit/parser/standard/DocumentEndEvent;-><init>()V

    sput-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->DOCUMENT_END:Lcom/rtfparserkit/parser/standard/IParserEvent;

    .line 440
    new-instance v0, Lcom/rtfparserkit/parser/standard/GroupStartEvent;

    invoke-direct {v0}, Lcom/rtfparserkit/parser/standard/GroupStartEvent;-><init>()V

    sput-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->GROUP_START:Lcom/rtfparserkit/parser/standard/IParserEvent;

    .line 441
    new-instance v0, Lcom/rtfparserkit/parser/standard/GroupEndEvent;

    invoke-direct {v0}, Lcom/rtfparserkit/parser/standard/GroupEndEvent;-><init>()V

    sput-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->GROUP_END:Lcom/rtfparserkit/parser/standard/IParserEvent;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 431
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handlerStack:Ljava/util/Deque;

    .line 433
    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserState;

    invoke-direct {v0}, Lcom/rtfparserkit/parser/standard/ParserState;-><init>()V

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    .line 434
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->stack:Ljava/util/Deque;

    .line 436
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->m_fontEncodings:Ljava/util/Map;

    return-void
.end method

.method private currentEncoding()Ljava/lang/String;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iget-object v0, v0, Lcom/rtfparserkit/parser/standard/ParserState;->currentFontEncoding:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iget-object v0, v0, Lcom/rtfparserkit/parser/standard/ParserState;->currentEncoding:Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iget-object v0, v0, Lcom/rtfparserkit/parser/standard/ParserState;->currentFontEncoding:Ljava/lang/String;

    return-object v0
.end method

.method private handleCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V
    .locals 1

    .line 405
    new-instance v0, Lcom/rtfparserkit/parser/standard/CommandEvent;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/rtfparserkit/parser/standard/CommandEvent;-><init>(Lcom/rtfparserkit/rtf/Command;IZZ)V

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    return-void
.end method

.method private handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V
    .locals 1

    .line 414
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    invoke-interface {v0, p1}, Lcom/rtfparserkit/parser/standard/IParserEventHandler;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    .line 415
    iget-object p1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    invoke-interface {p1}, Lcom/rtfparserkit/parser/standard/IParserEventHandler;->isComplete()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 417
    iget-object p1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handlerStack:Ljava/util/Deque;

    invoke-interface {p1}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    iput-object p1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    :cond_0
    return-void
.end method

.method private processCharacter(C)V
    .locals 1

    .line 397
    new-instance v0, Lcom/rtfparserkit/parser/standard/StringEvent;

    invoke-static {p1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/rtfparserkit/parser/standard/StringEvent;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    return-void
.end method

.method private processEncoding(Lcom/rtfparserkit/rtf/Command;ZI)V
    .locals 3

    .line 314
    sget-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser$1;->$SwitchMap$com$rtfparserkit$rtf$Command:[I

    invoke-virtual {p1}, Lcom/rtfparserkit/rtf/Command;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    if-eqz p2, :cond_0

    .line 342
    sget-object v0, Lcom/rtfparserkit/parser/standard/Encoding;->LOCALEID_MAPPING:Ljava/util/Map;

    invoke-direct {p0, p3}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->unsignedValue(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    move-object v1, v0

    goto :goto_0

    .line 337
    :pswitch_1
    const-string v1, "MacRoman"

    goto :goto_0

    .line 331
    :pswitch_2
    const-string v1, "Cp850"

    goto :goto_0

    .line 325
    :pswitch_3
    const-string v1, "Cp437"

    goto :goto_0

    .line 319
    :pswitch_4
    const-string v1, "Cp1252"

    :cond_0
    :goto_0
    if-nez v1, :cond_2

    .line 355
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unsupported encoding command "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/rtfparserkit/rtf/Command;->getCommandName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_1

    :cond_1
    const-string p1, ""

    :goto_1
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 358
    :cond_2
    iget-object p1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iput-object v1, p1, Lcom/rtfparserkit/parser/standard/ParserState;->currentEncoding:Ljava/lang/String;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private processFont(I)V
    .locals 2

    .line 292
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iput p1, v0, Lcom/rtfparserkit/parser/standard/ParserState;->currentFont:I

    .line 293
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->m_fontEncodings:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/rtfparserkit/parser/standard/ParserState;->currentFontEncoding:Ljava/lang/String;

    return-void
.end method

.method private processFontCharset(I)V
    .locals 3

    .line 301
    invoke-static {p1}, Lcom/rtfparserkit/parser/standard/FontCharset;->getCharset(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 304
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->m_fontEncodings:Ljava/util/Map;

    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iget v1, v1, Lcom/rtfparserkit/parser/standard/ParserState;->currentFont:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/rtfparserkit/parser/standard/Encoding;->LOCALEID_MAPPING:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private processUnicode(I)V
    .locals 0

    .line 366
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->unsignedValue(I)I

    move-result p1

    int-to-char p1, p1

    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    .line 367
    iget-object p1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iget p1, p1, Lcom/rtfparserkit/parser/standard/ParserState;->unicodeAlternateSkipCount:I

    iput p1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->skipBytes:I

    return-void
.end method

.method private processUnicodeAlternateSkipCount(I)V
    .locals 1

    .line 375
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    iput p1, v0, Lcom/rtfparserkit/parser/standard/ParserState;->unicodeAlternateSkipCount:I

    return-void
.end method

.method private processUpr(Lcom/rtfparserkit/parser/standard/IParserEvent;)V
    .locals 2

    .line 385
    new-instance v0, Lcom/rtfparserkit/parser/standard/UprHandler;

    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    invoke-direct {v0, v1}, Lcom/rtfparserkit/parser/standard/UprHandler;-><init>(Lcom/rtfparserkit/parser/standard/IParserEventHandler;)V

    .line 386
    invoke-interface {v0, p1}, Lcom/rtfparserkit/parser/standard/IParserEventHandler;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    .line 388
    iget-object p1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handlerStack:Ljava/util/Deque;

    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    invoke-interface {p1, v1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 389
    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    return-void
.end method

.method private unsignedValue(I)I
    .locals 1

    if-gez p1, :cond_0

    const/high16 v0, 0x10000

    add-int/2addr p1, v0

    :cond_0
    return p1
.end method


# virtual methods
.method public parse(Lcom/rtfparserkit/parser/IRtfSource;Lcom/rtfparserkit/parser/IRtfListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    new-instance v0, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;

    invoke-direct {v0, p2}, Lcom/rtfparserkit/parser/standard/DefaultEventHandler;-><init>(Lcom/rtfparserkit/parser/IRtfListener;)V

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    .line 49
    new-instance p2, Lcom/rtfparserkit/parser/raw/RawRtfParser;

    invoke-direct {p2}, Lcom/rtfparserkit/parser/raw/RawRtfParser;-><init>()V

    .line 50
    invoke-interface {p2, p1, p0}, Lcom/rtfparserkit/parser/IRtfParser;->parse(Lcom/rtfparserkit/parser/IRtfSource;Lcom/rtfparserkit/parser/IRtfListener;)V

    return-void
.end method

.method public processBinaryBytes([B)V
    .locals 1

    .line 130
    new-instance v0, Lcom/rtfparserkit/parser/standard/BinaryBytesEvent;

    invoke-direct {v0, p1}, Lcom/rtfparserkit/parser/standard/BinaryBytesEvent;-><init>([B)V

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    return-void
.end method

.method public processCharacterBytes([B)V
    .locals 5

    .line 82
    :try_start_0
    array-length v0, p1

    if-eqz v0, :cond_1

    .line 84
    iget v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->skipBytes:I

    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 86
    new-instance v0, Lcom/rtfparserkit/parser/standard/StringEvent;

    new-instance v1, Ljava/lang/String;

    iget v2, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->skipBytes:I

    array-length v3, p1

    sub-int/2addr v3, v2

    invoke-direct {p0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->currentEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, p1, v2, v3, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/rtfparserkit/parser/standard/StringEvent;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    :cond_0
    const/4 p1, 0x0

    .line 88
    iput p1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->skipBytes:I
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception p1

    .line 94
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public processCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V
    .locals 2

    .line 148
    invoke-virtual {p1}, Lcom/rtfparserkit/rtf/Command;->getCommandType()Lcom/rtfparserkit/rtf/CommandType;

    move-result-object p4

    sget-object v0, Lcom/rtfparserkit/rtf/CommandType;->Encoding:Lcom/rtfparserkit/rtf/CommandType;

    if-ne p4, v0, :cond_0

    .line 150
    invoke-direct {p0, p1, p3, p2}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processEncoding(Lcom/rtfparserkit/rtf/Command;ZI)V

    return-void

    .line 156
    :cond_0
    iget-object p4, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    invoke-interface {p4}, Lcom/rtfparserkit/parser/standard/IParserEventHandler;->getLastEvent()Lcom/rtfparserkit/parser/standard/IParserEvent;

    move-result-object p4

    .line 157
    invoke-interface {p4}, Lcom/rtfparserkit/parser/standard/IParserEvent;->getType()Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v0

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->COMMAND_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    if-ne v0, v1, :cond_1

    .line 159
    check-cast p4, Lcom/rtfparserkit/parser/standard/CommandEvent;

    invoke-virtual {p4}, Lcom/rtfparserkit/parser/standard/CommandEvent;->getCommand()Lcom/rtfparserkit/rtf/Command;

    move-result-object p4

    sget-object v0, Lcom/rtfparserkit/rtf/Command;->optionalcommand:Lcom/rtfparserkit/rtf/Command;

    if-ne p4, v0, :cond_1

    .line 161
    iget-object p4, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handler:Lcom/rtfparserkit/parser/standard/IParserEventHandler;

    invoke-interface {p4}, Lcom/rtfparserkit/parser/standard/IParserEventHandler;->removeLastEvent()V

    const/4 p4, 0x1

    goto :goto_0

    :cond_1
    const/4 p4, 0x0

    .line 166
    :goto_0
    sget-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser$1;->$SwitchMap$com$rtfparserkit$rtf$Command:[I

    invoke-virtual {p1}, Lcom/rtfparserkit/rtf/Command;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 280
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V

    return-void

    .line 273
    :pswitch_0
    invoke-direct {p0, p2}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processFontCharset(I)V

    .line 274
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V

    return-void

    .line 266
    :pswitch_1
    invoke-direct {p0, p2}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processFont(I)V

    .line 267
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V

    return-void

    :pswitch_2
    const/16 p1, 0x7d

    .line 260
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_3
    const/16 p1, 0x7b

    .line 254
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_4
    const/16 p1, 0x5c

    .line 248
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_5
    const/16 p1, 0x201d

    .line 242
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_6
    const/16 p1, 0x201c

    .line 236
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_7
    const/16 p1, 0x2019

    .line 230
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_8
    const/16 p1, 0x2018

    .line 224
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_9
    const/16 p1, 0x2022

    .line 218
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_a
    const/16 p1, 0x2005

    .line 212
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_b
    const/16 p1, 0x2002

    .line 206
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_c
    const/16 p1, 0x2003

    .line 200
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_d
    const/16 p1, 0x2013

    .line 194
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    :pswitch_e
    const/16 p1, 0x2014

    .line 188
    invoke-direct {p0, p1}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processCharacter(C)V

    return-void

    .line 182
    :pswitch_f
    new-instance v0, Lcom/rtfparserkit/parser/standard/CommandEvent;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/rtfparserkit/parser/standard/CommandEvent;-><init>(Lcom/rtfparserkit/rtf/Command;IZZ)V

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processUpr(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    return-void

    .line 176
    :pswitch_10
    invoke-direct {p0, p2}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processUnicodeAlternateSkipCount(I)V

    return-void

    .line 170
    :pswitch_11
    invoke-direct {p0, p2}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->processUnicode(I)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public processDocumentEnd()V
    .locals 1

    .line 121
    sget-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->DOCUMENT_END:Lcom/rtfparserkit/parser/standard/IParserEvent;

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    return-void
.end method

.method public processDocumentStart()V
    .locals 1

    .line 112
    sget-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->DOCUMENT_START:Lcom/rtfparserkit/parser/standard/IParserEvent;

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    return-void
.end method

.method public processGroupEnd()V
    .locals 1

    .line 70
    sget-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->GROUP_END:Lcom/rtfparserkit/parser/standard/IParserEvent;

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    .line 71
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->stack:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rtfparserkit/parser/standard/ParserState;

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    return-void
.end method

.method public processGroupStart()V
    .locals 2

    .line 59
    sget-object v0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->GROUP_START:Lcom/rtfparserkit/parser/standard/IParserEvent;

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    .line 60
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->stack:Ljava/util/Deque;

    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    invoke-interface {v0, v1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 61
    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserState;

    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    invoke-direct {v0, v1}, Lcom/rtfparserkit/parser/standard/ParserState;-><init>(Lcom/rtfparserkit/parser/standard/ParserState;)V

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->state:Lcom/rtfparserkit/parser/standard/ParserState;

    return-void
.end method

.method public processString(Ljava/lang/String;)V
    .locals 1

    .line 139
    new-instance v0, Lcom/rtfparserkit/parser/standard/StringEvent;

    invoke-direct {v0, p1}, Lcom/rtfparserkit/parser/standard/StringEvent;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;->handleEvent(Lcom/rtfparserkit/parser/standard/IParserEvent;)V

    return-void
.end method
