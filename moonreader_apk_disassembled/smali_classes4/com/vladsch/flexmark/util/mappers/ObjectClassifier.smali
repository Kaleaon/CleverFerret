.class public Lcom/vladsch/flexmark/util/mappers/ObjectClassifier;
.super Ljava/lang/Object;
.source "ObjectClassifier.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Computable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Computable<",
        "Ljava/lang/Class<",
        "*>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/vladsch/flexmark/util/mappers/ObjectClassifier;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 6
    new-instance v0, Lcom/vladsch/flexmark/util/mappers/ObjectClassifier;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/mappers/ObjectClassifier;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/mappers/ObjectClassifier;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/ObjectClassifier;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compute(Ljava/lang/Object;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic compute(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 5
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/mappers/ObjectClassifier;->compute(Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
