.class public Lcom/vladsch/flexmark/util/options/ParserMessage;
.super Ljava/lang/Object;
.source "ParserMessage.java"


# instance fields
.field protected final message:Ljava/lang/String;

.field protected final source:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected final status:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/lang/String;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/ParserMessage;->source:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    iput-object p2, p0, Lcom/vladsch/flexmark/util/options/ParserMessage;->status:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    .line 13
    iput-object p3, p0, Lcom/vladsch/flexmark/util/options/ParserMessage;->message:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserMessage;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getSource()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserMessage;->source:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getStatus()Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserMessage;->status:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    return-object v0
.end method
