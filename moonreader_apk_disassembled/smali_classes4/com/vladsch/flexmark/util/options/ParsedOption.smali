.class public Lcom/vladsch/flexmark/util/options/ParsedOption;
.super Ljava/lang/Object;
.source "ParsedOption.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final myMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParserMessage;",
            ">;"
        }
    .end annotation
.end field

.field protected final myOptionParser:Lcom/vladsch/flexmark/util/options/OptionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/OptionParser<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected final myOptionResult:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

.field protected final mySource:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Lcom/vladsch/flexmark/util/options/OptionParser<",
            "TT;>;",
            "Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 16
    move-object v1, v0

    check-cast v1, Ljava/util/List;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/util/options/ParsedOption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Lcom/vladsch/flexmark/util/options/ParserMessage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Lcom/vladsch/flexmark/util/options/OptionParser<",
            "TT;>;",
            "Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;",
            "Lcom/vladsch/flexmark/util/options/ParserMessage;",
            ")V"
        }
    .end annotation

    .line 20
    invoke-static {p4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p4

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/util/options/ParsedOption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Lcom/vladsch/flexmark/util/options/OptionParser<",
            "TT;>;",
            "Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParserMessage;",
            ">;)V"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 24
    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/options/ParsedOption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Lcom/vladsch/flexmark/util/options/OptionParser<",
            "TT;>;",
            "Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParserMessage;",
            ">;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParsedOption<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/ParsedOption;->mySource:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz p5, :cond_4

    if-eqz p4, :cond_0

    .line 31
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 33
    :goto_0
    invoke-interface {p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :cond_1
    :goto_1
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result p5

    if-eqz p5, :cond_3

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lcom/vladsch/flexmark/util/options/ParsedOption;

    .line 34
    invoke-virtual {p5}, Lcom/vladsch/flexmark/util/options/ParsedOption;->getOptionResult()Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->escalate(Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;)Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    move-result-object p3

    .line 35
    invoke-virtual {p5}, Lcom/vladsch/flexmark/util/options/ParsedOption;->getMessages()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    if-nez p1, :cond_2

    .line 36
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    :cond_2
    invoke-virtual {p5}, Lcom/vladsch/flexmark/util/options/ParsedOption;->getMessages()Ljava/util/List;

    move-result-object p5

    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_3
    move-object p4, p1

    .line 43
    :cond_4
    iput-object p2, p0, Lcom/vladsch/flexmark/util/options/ParsedOption;->myOptionParser:Lcom/vladsch/flexmark/util/options/OptionParser;

    .line 44
    iput-object p3, p0, Lcom/vladsch/flexmark/util/options/ParsedOption;->myOptionResult:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    .line 45
    iput-object p4, p0, Lcom/vladsch/flexmark/util/options/ParsedOption;->myMessages:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getMessages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParserMessage;",
            ">;"
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParsedOption;->myMessages:Ljava/util/List;

    return-object v0
.end method

.method public getOptionParser()Lcom/vladsch/flexmark/util/options/OptionParser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/options/OptionParser<",
            "TT;>;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParsedOption;->myOptionParser:Lcom/vladsch/flexmark/util/options/OptionParser;

    return-object v0
.end method

.method public getOptionResult()Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParsedOption;->myOptionResult:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    return-object v0
.end method

.method public getSource()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/ParsedOption;->mySource:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method
