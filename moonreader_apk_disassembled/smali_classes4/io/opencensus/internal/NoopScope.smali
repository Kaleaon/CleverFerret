.class public final Lio/opencensus/internal/NoopScope;
.super Ljava/lang/Object;
.source "NoopScope.java"

# interfaces
.implements Lio/opencensus/common/Scope;
.implements Ljava/lang/AutoCloseable;


# static fields
.field private static final INSTANCE:Lio/opencensus/common/Scope;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    new-instance v0, Lio/opencensus/internal/NoopScope;

    invoke-direct {v0}, Lio/opencensus/internal/NoopScope;-><init>()V

    sput-object v0, Lio/opencensus/internal/NoopScope;->INSTANCE:Lio/opencensus/common/Scope;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lio/opencensus/common/Scope;
    .locals 1

    .line 33
    sget-object v0, Lio/opencensus/internal/NoopScope;->INSTANCE:Lio/opencensus/common/Scope;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 0

    return-void
.end method
