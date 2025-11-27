.class public Lcom/vladsch/flexmark/util/options/ParserParams;
.super Ljava/lang/Object;
.source "ParserParams.java"


# instance fields
.field public messages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParserMessage;",
            ">;"
        }
    .end annotation
.end field

.field public skip:Z

.field public status:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserParams;->messages:Ljava/util/List;

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/options/ParserParams;->skip:Z

    .line 9
    sget-object v0, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->VALID:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserParams;->status:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    return-void
.end method


# virtual methods
.method public add(Lcom/vladsch/flexmark/util/options/ParserMessage;)Lcom/vladsch/flexmark/util/options/ParserParams;
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserParams;->messages:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserParams;->messages:Ljava/util/List;

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserParams;->messages:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/options/ParserMessage;->getStatus()Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/options/ParserParams;->escalate(Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;)Lcom/vladsch/flexmark/util/options/ParserParams;

    return-object p0
.end method

.method public escalate(Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;)Lcom/vladsch/flexmark/util/options/ParserParams;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParserParams;->status:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->escalate(Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;)Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/ParserParams;->status:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    return-object p0
.end method
