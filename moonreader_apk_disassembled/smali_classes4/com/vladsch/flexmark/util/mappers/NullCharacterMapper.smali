.class public Lcom/vladsch/flexmark/util/mappers/NullCharacterMapper;
.super Ljava/lang/Object;
.source "NullCharacterMapper.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/mappers/CharMapper;


# static fields
.field public static final INSTANCE:Lcom/vladsch/flexmark/util/mappers/NullCharacterMapper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/mappers/NullCharacterMapper;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/mappers/NullCharacterMapper;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/mappers/NullCharacterMapper;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/NullCharacterMapper;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public map(C)C
    .locals 0

    if-nez p1, :cond_0

    const p1, 0xfffd

    :cond_0
    return p1
.end method
