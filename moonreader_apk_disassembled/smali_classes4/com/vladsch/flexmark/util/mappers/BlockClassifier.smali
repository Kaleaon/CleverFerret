.class public Lcom/vladsch/flexmark/util/mappers/BlockClassifier;
.super Ljava/lang/Object;
.source "BlockClassifier.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Computable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Computable<",
        "Ljava/lang/Class<",
        "+",
        "Lcom/vladsch/flexmark/util/ast/Block;",
        ">;",
        "Lcom/vladsch/flexmark/util/ast/Block;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/vladsch/flexmark/util/mappers/BlockClassifier;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    new-instance v0, Lcom/vladsch/flexmark/util/mappers/BlockClassifier;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/mappers/BlockClassifier;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/mappers/BlockClassifier;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/BlockClassifier;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compute(Lcom/vladsch/flexmark/util/ast/Block;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ")",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ">;"
        }
    .end annotation

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic compute(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 6
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Block;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/mappers/BlockClassifier;->compute(Lcom/vladsch/flexmark/util/ast/Block;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
