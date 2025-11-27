.class Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$1;
.super Ljava/lang/Object;
.source "CoreNodeFormatter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderDocument(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/FormattingPhase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/vladsch/flexmark/util/options/DataKey<",
        "*>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V
    .locals 0

    .line 123
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$1;->this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vladsch/flexmark/util/options/DataKey;Lcom/vladsch/flexmark/util/options/DataKey;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "*>;",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "*>;)I"
        }
    .end annotation

    .line 126
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/options/DataKey;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 123
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataKey;

    check-cast p2, Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$1;->compare(Lcom/vladsch/flexmark/util/options/DataKey;Lcom/vladsch/flexmark/util/options/DataKey;)I

    move-result p1

    return p1
.end method
