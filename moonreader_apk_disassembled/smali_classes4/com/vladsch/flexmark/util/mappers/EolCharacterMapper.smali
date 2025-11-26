.class public Lcom/vladsch/flexmark/util/mappers/EolCharacterMapper;
.super Ljava/lang/Object;
.source "EolCharacterMapper.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/mappers/CharMapper;


# static fields
.field public static final INSTANCE:Lcom/vladsch/flexmark/util/mappers/EolCharacterMapper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/mappers/EolCharacterMapper;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/mappers/EolCharacterMapper;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/mappers/EolCharacterMapper;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/EolCharacterMapper;

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

    const/16 p1, 0xa

    return p1
.end method
