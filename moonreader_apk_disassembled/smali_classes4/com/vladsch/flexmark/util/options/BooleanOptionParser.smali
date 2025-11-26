.class public abstract Lcom/vladsch/flexmark/util/options/BooleanOptionParser;
.super Ljava/lang/Object;
.source "BooleanOptionParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/OptionParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/options/OptionParser<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final KEY_OPTION_0_PARAMETERS_1_IGNORED:Ljava/lang/String; = "options.parser.boolean-option.ignored"

.field public static final OPTION_0_PARAMETERS_1_IGNORED:Ljava/lang/String; = "Option {0} does not have any parameters. {1} was ignored"


# instance fields
.field private final myOptionName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/BooleanOptionParser;->myOptionName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getOptionName()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/BooleanOptionParser;->myOptionName:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionText(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/options/BooleanOptionParser;->isOptionSet(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/options/BooleanOptionParser;->isOptionSet(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/options/BooleanOptionParser;->myOptionName:Ljava/lang/String;

    return-object p1

    :cond_1
    const-string p1, ""

    return-object p1
.end method

.method protected abstract isOptionSet(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method

.method public parseOption(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/Object;Lcom/vladsch/flexmark/util/options/MessageProvider;)Lcom/vladsch/flexmark/util/Pair;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "TT;",
            "Lcom/vladsch/flexmark/util/options/MessageProvider;",
            ")",
            "Lcom/vladsch/flexmark/util/Pair<",
            "TT;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParsedOption<",
            "TT;>;>;>;"
        }
    .end annotation

    .line 29
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    new-instance p3, Lcom/vladsch/flexmark/util/Pair;

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/options/BooleanOptionParser;->setOptions(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    new-instance v0, Lcom/vladsch/flexmark/util/options/ParsedOption;

    sget-object v1, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->VALID:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    invoke-direct {v0, p1, p0, v1}, Lcom/vladsch/flexmark/util/options/ParsedOption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {p3, p2, p1}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p3

    :cond_0
    if-nez p3, :cond_1

    .line 32
    sget-object p3, Lcom/vladsch/flexmark/util/options/MessageProvider;->DEFAULT:Lcom/vladsch/flexmark/util/options/MessageProvider;

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/BooleanOptionParser;->myOptionName:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    aput-object p1, v1, v0

    const-string v0, "options.parser.boolean-option.ignored"

    const-string v2, "Option {0} does not have any parameters. {1} was ignored"

    invoke-interface {p3, v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MessageProvider;->message(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/util/Pair;

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/options/BooleanOptionParser;->setOptions(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    new-instance v1, Lcom/vladsch/flexmark/util/options/ParsedOption;

    sget-object v2, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->IGNORED:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    new-instance v3, Lcom/vladsch/flexmark/util/options/ParserMessage;

    sget-object v4, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->IGNORED:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    invoke-direct {v3, p1, v4, p3}, Lcom/vladsch/flexmark/util/options/ParserMessage;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/lang/String;)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p3

    invoke-direct {v1, p1, p0, v2, p3}, Lcom/vladsch/flexmark/util/options/ParsedOption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/util/List;)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p2, p1}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected abstract setOptions(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method
