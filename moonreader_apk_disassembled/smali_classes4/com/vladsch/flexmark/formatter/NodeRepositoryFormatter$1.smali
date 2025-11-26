.class Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$1;
.super Ljava/lang/Object;
.source "NodeRepositoryFormatter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/options/DataKey;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "TB;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;)V
    .locals 0

    .line 95
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$1;->this$0:Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;TB;)I"
        }
    .end annotation

    .line 98
    check-cast p1, Ljava/lang/Comparable;

    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 95
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Node;

    check-cast p2, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$1;->compare(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)I

    move-result p1

    return p1
.end method
