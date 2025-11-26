.class final Lcom/vladsch/flexmark/util/Utils$1;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/Utils;->stringSorted(Ljava/util/Collection;Lcom/vladsch/flexmark/util/Computable;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$stringer:Lcom/vladsch/flexmark/util/Computable;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/Computable;)V
    .locals 0

    .line 368
    iput-object p1, p0, Lcom/vladsch/flexmark/util/Utils$1;->val$stringer:Lcom/vladsch/flexmark/util/Computable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 371
    iget-object v0, p0, Lcom/vladsch/flexmark/util/Utils$1;->val$stringer:Lcom/vladsch/flexmark/util/Computable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/Computable;->compute(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/Utils$1;->val$stringer:Lcom/vladsch/flexmark/util/Computable;

    invoke-interface {v0, p2}, Lcom/vladsch/flexmark/util/Computable;->compute(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method
