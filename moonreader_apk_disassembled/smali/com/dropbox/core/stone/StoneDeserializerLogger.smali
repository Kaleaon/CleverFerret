.class public Lcom/dropbox/core/stone/StoneDeserializerLogger;
.super Ljava/lang/Object;
.source "StoneDeserializerLogger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/stone/StoneDeserializerLogger$LoggerCallback;
    }
.end annotation


# static fields
.field public static LOGGER_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/dropbox/core/stone/StoneDeserializerLogger$LoggerCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/dropbox/core/stone/StoneDeserializerLogger;->LOGGER_MAP:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static log(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 17
    sget-object v1, Lcom/dropbox/core/stone/StoneDeserializerLogger;->LOGGER_MAP:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 18
    sget-object v1, Lcom/dropbox/core/stone/StoneDeserializerLogger;->LOGGER_MAP:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/stone/StoneDeserializerLogger$LoggerCallback;

    .line 19
    invoke-interface {v0, p0, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger$LoggerCallback;->invoke(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static registerCallback(Ljava/lang/Class;Lcom/dropbox/core/stone/StoneDeserializerLogger$LoggerCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/dropbox/core/stone/StoneDeserializerLogger$LoggerCallback;",
            ")V"
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/dropbox/core/stone/StoneDeserializerLogger;->LOGGER_MAP:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
