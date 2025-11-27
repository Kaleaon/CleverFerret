.class public abstract Lcom/dropbox/core/util/Maybe;
.super Ljava/lang/Object;
.source "Maybe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/util/Maybe$Nothing;,
        Lcom/dropbox/core/util/Maybe$Just;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final Nothing:Lcom/dropbox/core/util/Maybe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/util/Maybe<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 57
    new-instance v0, Lcom/dropbox/core/util/Maybe$Nothing;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dropbox/core/util/Maybe$Nothing;-><init>(Lcom/dropbox/core/util/Maybe$1;)V

    sput-object v0, Lcom/dropbox/core/util/Maybe;->Nothing:Lcom/dropbox/core/util/Maybe;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dropbox/core/util/Maybe$1;)V
    .locals 0

    .line 3
    invoke-direct {p0}, Lcom/dropbox/core/util/Maybe;-><init>()V

    return-void
.end method

.method public static Just(Ljava/lang/Object;)Lcom/dropbox/core/util/Maybe;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lcom/dropbox/core/util/Maybe<",
            "TT;>;"
        }
    .end annotation

    .line 17
    new-instance v0, Lcom/dropbox/core/util/Maybe$Just;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/dropbox/core/util/Maybe$Just;-><init>(Ljava/lang/Object;Lcom/dropbox/core/util/Maybe$1;)V

    return-object v0
.end method

.method public static Nothing()Lcom/dropbox/core/util/Maybe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/dropbox/core/util/Maybe<",
            "TT;>;"
        }
    .end annotation

    .line 54
    sget-object v0, Lcom/dropbox/core/util/Maybe;->Nothing:Lcom/dropbox/core/util/Maybe;

    return-object v0
.end method


# virtual methods
.method public abstract equals(Lcom/dropbox/core/util/Maybe;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/util/Maybe<",
            "TT;>;)Z"
        }
    .end annotation
.end method

.method public abstract get(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method

.method public abstract getJust()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract hashCode()I
.end method

.method public abstract isJust()Z
.end method

.method public abstract isNothing()Z
.end method

.method public abstract toString()Ljava/lang/String;
.end method
