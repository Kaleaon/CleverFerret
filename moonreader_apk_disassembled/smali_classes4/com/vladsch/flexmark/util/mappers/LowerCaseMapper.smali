.class public Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;
.super Ljava/lang/Object;
.source "LowerCaseMapper.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/mappers/CharMapper;


# static fields
.field public static final INSTANCE:Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;


# instance fields
.field locale:Ljava/util/Locale;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 6
    new-instance v0, Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;->locale:Ljava/util/Locale;

    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 14
    iput-object p1, p0, Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;->locale:Ljava/util/Locale;

    return-void
.end method


# virtual methods
.method public map(C)C
    .locals 0

    if-nez p1, :cond_0

    const p1, 0xfffd

    return p1

    .line 19
    :cond_0
    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p1

    return p1
.end method
