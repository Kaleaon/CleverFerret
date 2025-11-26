.class Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$1;
.super Ljava/lang/Object;
.source "AbbreviationNodePostProcessor.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->computeAbbreviations(Lcom/vladsch/flexmark/util/ast/Document;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;)V
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$1;->this$0:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 46
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$1;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public compare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 49
    invoke-virtual {p2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method
