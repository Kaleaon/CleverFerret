.class public final Lio/opencensus/common/Functions;
.super Ljava/lang/Object;
.source "Functions.java"


# static fields
.field private static final RETURN_NULL:Lio/opencensus/common/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private static final RETURN_TO_STRING:Lio/opencensus/common/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final THROW_ASSERTION_ERROR:Lio/opencensus/common/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private static final THROW_ILLEGAL_ARGUMENT_EXCEPTION:Lio/opencensus/common/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    new-instance v0, Lio/opencensus/common/Functions$1;

    invoke-direct {v0}, Lio/opencensus/common/Functions$1;-><init>()V

    sput-object v0, Lio/opencensus/common/Functions;->RETURN_NULL:Lio/opencensus/common/Function;

    .line 40
    new-instance v0, Lio/opencensus/common/Functions$2;

    invoke-direct {v0}, Lio/opencensus/common/Functions$2;-><init>()V

    sput-object v0, Lio/opencensus/common/Functions;->THROW_ILLEGAL_ARGUMENT_EXCEPTION:Lio/opencensus/common/Function;

    .line 48
    new-instance v0, Lio/opencensus/common/Functions$3;

    invoke-direct {v0}, Lio/opencensus/common/Functions$3;-><init>()V

    sput-object v0, Lio/opencensus/common/Functions;->THROW_ASSERTION_ERROR:Lio/opencensus/common/Function;

    .line 56
    new-instance v0, Lio/opencensus/common/Functions$4;

    invoke-direct {v0}, Lio/opencensus/common/Functions$4;-><init>()V

    sput-object v0, Lio/opencensus/common/Functions;->RETURN_TO_STRING:Lio/opencensus/common/Function;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static returnConstant(Ljava/lang/Object;)Lio/opencensus/common/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "TT;>;"
        }
    .end annotation

    .line 84
    new-instance v0, Lio/opencensus/common/Functions$5;

    invoke-direct {v0, p0}, Lio/opencensus/common/Functions$5;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static returnNull()Lio/opencensus/common/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "TT;>;"
        }
    .end annotation

    .line 73
    sget-object v0, Lio/opencensus/common/Functions;->RETURN_NULL:Lio/opencensus/common/Function;

    return-object v0
.end method

.method public static returnToString()Lio/opencensus/common/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 99
    sget-object v0, Lio/opencensus/common/Functions;->RETURN_TO_STRING:Lio/opencensus/common/Function;

    return-object v0
.end method

.method public static throwAssertionError()Lio/opencensus/common/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "TT;>;"
        }
    .end annotation

    .line 127
    sget-object v0, Lio/opencensus/common/Functions;->THROW_ASSERTION_ERROR:Lio/opencensus/common/Function;

    return-object v0
.end method

.method public static throwIllegalArgumentException()Lio/opencensus/common/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "TT;>;"
        }
    .end annotation

    .line 113
    sget-object v0, Lio/opencensus/common/Functions;->THROW_ILLEGAL_ARGUMENT_EXCEPTION:Lio/opencensus/common/Function;

    return-object v0
.end method
