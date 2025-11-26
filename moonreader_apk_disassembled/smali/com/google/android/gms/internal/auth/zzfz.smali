.class final Lcom/google/android/gms/internal/auth/zzfz;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-auth-base@@18.0.4"

# interfaces
.implements Lcom/google/android/gms/internal/auth/zzgh;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/auth/zzgh<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final zza:[I

.field private static final zzb:Lsun/misc/Unsafe;


# instance fields
.field private final zzc:[I

.field private final zzd:[Ljava/lang/Object;

.field private final zze:I

.field private final zzf:I

.field private final zzg:Lcom/google/android/gms/internal/auth/zzfw;

.field private final zzh:Z

.field private final zzi:[I

.field private final zzj:I

.field private final zzk:I

.field private final zzl:Lcom/google/android/gms/internal/auth/zzfk;

.field private final zzm:Lcom/google/android/gms/internal/auth/zzgy;

.field private final zzn:Lcom/google/android/gms/internal/auth/zzel;

.field private final zzo:Lcom/google/android/gms/internal/auth/zzgb;

.field private final zzp:Lcom/google/android/gms/internal/auth/zzfr;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    new-array v0, v0, [I

    sput-object v0, Lcom/google/android/gms/internal/auth/zzfz;->zza:[I

    invoke-static {}, Lcom/google/android/gms/internal/auth/zzhi;->zzg()Lsun/misc/Unsafe;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/auth/zzfz;->zzb:Lsun/misc/Unsafe;

    return-void
.end method

.method private constructor <init>([I[Ljava/lang/Object;IILcom/google/android/gms/internal/auth/zzfw;ZZ[IIILcom/google/android/gms/internal/auth/zzgb;Lcom/google/android/gms/internal/auth/zzfk;Lcom/google/android/gms/internal/auth/zzgy;Lcom/google/android/gms/internal/auth/zzel;Lcom/google/android/gms/internal/auth/zzfr;[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    iput-object p2, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzd:[Ljava/lang/Object;

    iput p3, p0, Lcom/google/android/gms/internal/auth/zzfz;->zze:I

    iput p4, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzf:I

    iput-boolean p6, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzh:Z

    iput-object p8, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzi:[I

    iput p9, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzj:I

    iput p10, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzk:I

    iput-object p11, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzo:Lcom/google/android/gms/internal/auth/zzgb;

    iput-object p12, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzl:Lcom/google/android/gms/internal/auth/zzfk;

    iput-object p13, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzm:Lcom/google/android/gms/internal/auth/zzgy;

    iput-object p14, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzn:Lcom/google/android/gms/internal/auth/zzel;

    iput-object p5, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzg:Lcom/google/android/gms/internal/auth/zzfw;

    iput-object p15, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzp:Lcom/google/android/gms/internal/auth/zzfr;

    return-void
.end method

.method private static zzA(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 2
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    .line 6
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Field "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " for "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " not found. Known fields are "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private final zzB(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 3

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result v0

    const v1, 0xfffff

    and-int/2addr v0, v1

    int-to-long v0, v0

    .line 2
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 3
    :cond_0
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 4
    invoke-static {p2, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p2

    if-eqz v2, :cond_2

    if-nez p2, :cond_1

    goto :goto_0

    .line 7
    :cond_1
    invoke-static {v2, p2}, Lcom/google/android/gms/internal/auth/zzez;->zzg(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 8
    invoke-static {p1, v0, v1, p2}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 9
    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    return-void

    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    .line 5
    invoke-static {p1, v0, v1, p2}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 6
    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    :cond_3
    :goto_1
    return-void
.end method

.method private final zzC(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 4

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    .line 2
    aget v1, v1, p3

    const v2, 0xfffff

    and-int/2addr v0, v2

    int-to-long v2, v0

    .line 3
    invoke-direct {p0, p2, v1, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 4
    :cond_0
    invoke-direct {p0, p1, v1, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 5
    invoke-static {p1, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 6
    :goto_0
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p2

    if-eqz v0, :cond_3

    if-nez p2, :cond_2

    goto :goto_1

    .line 9
    :cond_2
    invoke-static {v0, p2}, Lcom/google/android/gms/internal/auth/zzez;->zzg(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 10
    invoke-static {p1, v2, v3, p2}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 11
    invoke-direct {p0, p1, v1, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzE(Ljava/lang/Object;II)V

    return-void

    :cond_3
    :goto_1
    if-eqz p2, :cond_4

    .line 7
    invoke-static {p1, v2, v3, p2}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 8
    invoke-direct {p0, p1, v1, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzE(Ljava/lang/Object;II)V

    :cond_4
    :goto_2
    return-void
.end method

.method private final zzD(Ljava/lang/Object;I)V
    .locals 5

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/auth/zzfz;->zzs(I)I

    move-result p2

    const v0, 0xfffff

    and-int/2addr v0, p2

    int-to-long v0, v0

    const-wide/32 v2, 0xfffff

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v2

    ushr-int/lit8 p2, p2, 0x14

    const/4 v3, 0x1

    shl-int p2, v3, p2

    or-int/2addr p2, v2

    .line 3
    invoke-static {p1, v0, v1, p2}, Lcom/google/android/gms/internal/auth/zzhi;->zzn(Ljava/lang/Object;JI)V

    return-void
.end method

.method private final zzE(Ljava/lang/Object;II)V
    .locals 2

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzs(I)I

    move-result p3

    const v0, 0xfffff

    and-int/2addr p3, v0

    int-to-long v0, p3

    .line 2
    invoke-static {p1, v0, v1, p2}, Lcom/google/android/gms/internal/auth/zzhi;->zzn(Ljava/lang/Object;JI)V

    return-void
.end method

.method private final zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result p1

    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result p2

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private final zzG(Ljava/lang/Object;I)Z
    .locals 9

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/auth/zzfz;->zzs(I)I

    move-result v0

    const v1, 0xfffff

    and-int v2, v0, v1

    int-to-long v2, v2

    const-wide/32 v4, 0xfffff

    const/4 v6, 0x0

    const/4 v7, 0x1

    cmp-long v8, v2, v4

    if-nez v8, :cond_14

    .line 2
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result p2

    and-int v0, p2, v1

    int-to-long v0, v0

    invoke-static {p2}, Lcom/google/android/gms/internal/auth/zzfz;->zzu(I)I

    move-result p2

    const-wide/16 v2, 0x0

    packed-switch p2, :pswitch_data_0

    .line 17
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 26
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    .line 3
    :pswitch_0
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    return v7

    :cond_0
    return v6

    .line 4
    :pswitch_1
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long v0, p1, v2

    if-eqz v0, :cond_1

    return v7

    :cond_1
    return v6

    .line 5
    :pswitch_2
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_2

    return v7

    :cond_2
    return v6

    .line 6
    :pswitch_3
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long v0, p1, v2

    if-eqz v0, :cond_3

    return v7

    :cond_3
    return v6

    .line 7
    :pswitch_4
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_4

    return v7

    :cond_4
    return v6

    .line 8
    :pswitch_5
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_5

    return v7

    :cond_5
    return v6

    .line 9
    :pswitch_6
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_6

    return v7

    :cond_6
    return v6

    .line 10
    :pswitch_7
    sget-object p2, Lcom/google/android/gms/internal/auth/zzee;->zzb:Lcom/google/android/gms/internal/auth/zzee;

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/auth/zzee;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    return v7

    :cond_7
    return v6

    .line 11
    :pswitch_8
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_8

    return v7

    :cond_8
    return v6

    .line 12
    :pswitch_9
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    .line 13
    instance-of p2, p1, Ljava/lang/String;

    if-eqz p2, :cond_a

    .line 14
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_9

    return v7

    :cond_9
    return v6

    .line 15
    :cond_a
    instance-of p2, p1, Lcom/google/android/gms/internal/auth/zzee;

    if-eqz p2, :cond_c

    .line 16
    sget-object p2, Lcom/google/android/gms/internal/auth/zzee;->zzb:Lcom/google/android/gms/internal/auth/zzee;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/auth/zzee;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_b

    return v7

    :cond_b
    return v6

    .line 27
    :cond_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 17
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    .line 18
    :pswitch_a
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzt(Ljava/lang/Object;J)Z

    move-result p1

    return p1

    .line 19
    :pswitch_b
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_d

    return v7

    :cond_d
    return v6

    .line 20
    :pswitch_c
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long v0, p1, v2

    if-eqz v0, :cond_e

    return v7

    :cond_e
    return v6

    .line 21
    :pswitch_d
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_f

    return v7

    :cond_f
    return v6

    .line 22
    :pswitch_e
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long v0, p1, v2

    if-eqz v0, :cond_10

    return v7

    :cond_10
    return v6

    .line 23
    :pswitch_f
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long v0, p1, v2

    if-eqz v0, :cond_11

    return v7

    :cond_11
    return v6

    .line 24
    :pswitch_10
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzb(Ljava/lang/Object;J)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    if-eqz p1, :cond_12

    return v7

    :cond_12
    return v6

    .line 25
    :pswitch_11
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zza(Ljava/lang/Object;J)D

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    cmp-long v0, p1, v2

    if-eqz v0, :cond_13

    return v7

    :cond_13
    return v6

    .line 27
    :cond_14
    invoke-static {p1, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result p1

    ushr-int/lit8 p2, v0, 0x14

    shl-int p2, v7, p2

    and-int/2addr p1, p2

    if-eqz p1, :cond_15

    return v7

    :cond_15
    return v6

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final zzH(Ljava/lang/Object;IIII)Z
    .locals 1

    const v0, 0xfffff

    if-ne p3, v0, :cond_0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result p1

    return p1

    :cond_0
    and-int p1, p4, p5

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private static zzI(Ljava/lang/Object;ILcom/google/android/gms/internal/auth/zzgh;)Z
    .locals 2

    const v0, 0xfffff

    and-int/2addr p1, v0

    int-to-long v0, p1

    .line 1
    invoke-static {p0, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    .line 2
    invoke-interface {p2, p0}, Lcom/google/android/gms/internal/auth/zzgh;->zzi(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private final zzJ(Ljava/lang/Object;II)Z
    .locals 2

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/auth/zzfz;->zzs(I)I

    move-result p3

    const v0, 0xfffff

    and-int/2addr p3, v0

    int-to-long v0, p3

    .line 2
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method static zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/auth/zzgz;
    .locals 2

    .line 1
    check-cast p0, Lcom/google/android/gms/internal/auth/zzeu;

    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzeu;->zzc:Lcom/google/android/gms/internal/auth/zzgz;

    invoke-static {}, Lcom/google/android/gms/internal/auth/zzgz;->zza()Lcom/google/android/gms/internal/auth/zzgz;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/auth/zzgz;->zzc()Lcom/google/android/gms/internal/auth/zzgz;

    move-result-object v0

    .line 2
    iput-object v0, p0, Lcom/google/android/gms/internal/auth/zzeu;->zzc:Lcom/google/android/gms/internal/auth/zzgz;

    :cond_0
    return-object v0
.end method

.method static zzj(Ljava/lang/Class;Lcom/google/android/gms/internal/auth/zzft;Lcom/google/android/gms/internal/auth/zzgb;Lcom/google/android/gms/internal/auth/zzfk;Lcom/google/android/gms/internal/auth/zzgy;Lcom/google/android/gms/internal/auth/zzel;Lcom/google/android/gms/internal/auth/zzfr;)Lcom/google/android/gms/internal/auth/zzfz;
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/google/android/gms/internal/auth/zzgg;

    if-eqz p0, :cond_0

    .line 2
    check-cast p1, Lcom/google/android/gms/internal/auth/zzgg;

    invoke-static/range {p1 .. p6}, Lcom/google/android/gms/internal/auth/zzfz;->zzk(Lcom/google/android/gms/internal/auth/zzgg;Lcom/google/android/gms/internal/auth/zzgb;Lcom/google/android/gms/internal/auth/zzfk;Lcom/google/android/gms/internal/auth/zzgy;Lcom/google/android/gms/internal/auth/zzel;Lcom/google/android/gms/internal/auth/zzfr;)Lcom/google/android/gms/internal/auth/zzfz;

    move-result-object p0

    return-object p0

    .line 3
    :cond_0
    check-cast p1, Lcom/google/android/gms/internal/auth/zzgv;

    const/4 p0, 0x0

    .line 4
    throw p0
.end method

.method static zzk(Lcom/google/android/gms/internal/auth/zzgg;Lcom/google/android/gms/internal/auth/zzgb;Lcom/google/android/gms/internal/auth/zzfk;Lcom/google/android/gms/internal/auth/zzgy;Lcom/google/android/gms/internal/auth/zzel;Lcom/google/android/gms/internal/auth/zzfr;)Lcom/google/android/gms/internal/auth/zzfz;
    .locals 34

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/auth/zzgg;->zzc()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v10, 0x1

    goto :goto_0

    :cond_0
    const/4 v10, 0x0

    .line 2
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/auth/zzgg;->zzd()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 3
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const v5, 0xd800

    if-lt v4, v5, :cond_1

    const/4 v4, 0x1

    :goto_1
    add-int/lit8 v6, v4, 0x1

    .line 4
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_2

    move v4, v6

    goto :goto_1

    :cond_1
    const/4 v6, 0x1

    :cond_2
    add-int/lit8 v4, v6, 0x1

    .line 5
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v5, :cond_4

    and-int/lit16 v6, v6, 0x1fff

    const/16 v8, 0xd

    :goto_2
    add-int/lit8 v9, v4, 0x1

    .line 6
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_3

    and-int/lit16 v4, v4, 0x1fff

    shl-int/2addr v4, v8

    or-int/2addr v6, v4

    add-int/lit8 v8, v8, 0xd

    move v4, v9

    goto :goto_2

    :cond_3
    shl-int/2addr v4, v8

    or-int/2addr v6, v4

    move v4, v9

    :cond_4
    if-nez v6, :cond_5

    sget-object v6, Lcom/google/android/gms/internal/auth/zzfz;->zza:[I

    move-object v12, v6

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    goto/16 :goto_b

    :cond_5
    add-int/lit8 v6, v4, 0x1

    .line 7
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_7

    and-int/lit16 v4, v4, 0x1fff

    const/16 v8, 0xd

    :goto_3
    add-int/lit8 v9, v6, 0x1

    .line 8
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v5, :cond_6

    and-int/lit16 v6, v6, 0x1fff

    shl-int/2addr v6, v8

    or-int/2addr v4, v6

    add-int/lit8 v8, v8, 0xd

    move v6, v9

    goto :goto_3

    :cond_6
    shl-int/2addr v6, v8

    or-int/2addr v4, v6

    move v6, v9

    :cond_7
    add-int/lit8 v8, v6, 0x1

    .line 9
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v5, :cond_9

    and-int/lit16 v6, v6, 0x1fff

    const/16 v9, 0xd

    :goto_4
    add-int/lit8 v11, v8, 0x1

    .line 10
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v5, :cond_8

    and-int/lit16 v8, v8, 0x1fff

    shl-int/2addr v8, v9

    or-int/2addr v6, v8

    add-int/lit8 v9, v9, 0xd

    move v8, v11

    goto :goto_4

    :cond_8
    shl-int/2addr v8, v9

    or-int/2addr v6, v8

    move v8, v11

    :cond_9
    add-int/lit8 v9, v8, 0x1

    .line 11
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v5, :cond_b

    and-int/lit16 v8, v8, 0x1fff

    const/16 v11, 0xd

    :goto_5
    add-int/lit8 v12, v9, 0x1

    .line 12
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v5, :cond_a

    and-int/lit16 v9, v9, 0x1fff

    shl-int/2addr v9, v11

    or-int/2addr v8, v9

    add-int/lit8 v11, v11, 0xd

    move v9, v12

    goto :goto_5

    :cond_a
    shl-int/2addr v9, v11

    or-int/2addr v8, v9

    move v9, v12

    :cond_b
    add-int/lit8 v11, v9, 0x1

    .line 13
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v5, :cond_d

    and-int/lit16 v9, v9, 0x1fff

    const/16 v12, 0xd

    :goto_6
    add-int/lit8 v13, v11, 0x1

    .line 14
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-lt v11, v5, :cond_c

    and-int/lit16 v11, v11, 0x1fff

    shl-int/2addr v11, v12

    or-int/2addr v9, v11

    add-int/lit8 v12, v12, 0xd

    move v11, v13

    goto :goto_6

    :cond_c
    shl-int/2addr v11, v12

    or-int/2addr v9, v11

    move v11, v13

    :cond_d
    add-int/lit8 v12, v11, 0x1

    .line 15
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-lt v11, v5, :cond_f

    and-int/lit16 v11, v11, 0x1fff

    const/16 v13, 0xd

    :goto_7
    add-int/lit8 v14, v12, 0x1

    .line 16
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v5, :cond_e

    and-int/lit16 v12, v12, 0x1fff

    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    add-int/lit8 v13, v13, 0xd

    move v12, v14

    goto :goto_7

    :cond_e
    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    move v12, v14

    :cond_f
    add-int/lit8 v13, v12, 0x1

    .line 17
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v5, :cond_11

    and-int/lit16 v12, v12, 0x1fff

    const/16 v14, 0xd

    :goto_8
    add-int/lit8 v15, v13, 0x1

    .line 18
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v5, :cond_10

    and-int/lit16 v13, v13, 0x1fff

    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    add-int/lit8 v14, v14, 0xd

    move v13, v15

    goto :goto_8

    :cond_10
    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    move v13, v15

    :cond_11
    add-int/lit8 v14, v13, 0x1

    .line 19
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v5, :cond_13

    and-int/lit16 v13, v13, 0x1fff

    const/16 v15, 0xd

    :goto_9
    add-int/lit8 v16, v14, 0x1

    .line 20
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v5, :cond_12

    and-int/lit16 v14, v14, 0x1fff

    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    add-int/lit8 v15, v15, 0xd

    move/from16 v14, v16

    goto :goto_9

    :cond_12
    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    move/from16 v14, v16

    :cond_13
    add-int/lit8 v15, v14, 0x1

    .line 21
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v5, :cond_15

    and-int/lit16 v14, v14, 0x1fff

    const/16 v16, 0xd

    :goto_a
    add-int/lit8 v17, v15, 0x1

    .line 22
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-lt v15, v5, :cond_14

    and-int/lit16 v15, v15, 0x1fff

    shl-int v15, v15, v16

    or-int/2addr v14, v15

    add-int/lit8 v16, v16, 0xd

    move/from16 v15, v17

    goto :goto_a

    :cond_14
    shl-int v15, v15, v16

    or-int/2addr v14, v15

    move/from16 v15, v17

    :cond_15
    add-int v16, v14, v12

    add-int v13, v16, v13

    .line 23
    new-array v13, v13, [I

    add-int v16, v4, v4

    add-int v16, v16, v6

    move-object v6, v13

    move v13, v12

    move-object v12, v6

    move v6, v4

    move v4, v15

    .line 6
    :goto_b
    sget-object v15, Lcom/google/android/gms/internal/auth/zzfz;->zzb:Lsun/misc/Unsafe;

    .line 24
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/auth/zzgg;->zze()[Ljava/lang/Object;

    move-result-object v17

    .line 25
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/auth/zzgg;->zza()Lcom/google/android/gms/internal/auth/zzfw;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const/16 v18, 0x1

    mul-int/lit8 v3, v11, 0x3

    .line 26
    new-array v3, v3, [I

    add-int/2addr v11, v11

    .line 27
    new-array v11, v11, [Ljava/lang/Object;

    add-int/2addr v13, v14

    move/from16 v23, v13

    move/from16 v22, v14

    const/16 v20, 0x0

    const/16 v21, 0x0

    :goto_c
    if-ge v4, v1, :cond_32

    add-int/lit8 v24, v4, 0x1

    .line 28
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_17

    and-int/lit16 v4, v4, 0x1fff

    move/from16 v7, v24

    const/16 v24, 0xd

    :goto_d
    add-int/lit8 v25, v7, 0x1

    .line 29
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v5, :cond_16

    and-int/lit16 v7, v7, 0x1fff

    shl-int v7, v7, v24

    or-int/2addr v4, v7

    add-int/lit8 v24, v24, 0xd

    move/from16 v7, v25

    goto :goto_d

    :cond_16
    shl-int v7, v7, v24

    or-int/2addr v4, v7

    move/from16 v7, v25

    goto :goto_e

    :cond_17
    move/from16 v7, v24

    :goto_e
    add-int/lit8 v24, v7, 0x1

    .line 30
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v5, :cond_19

    and-int/lit16 v7, v7, 0x1fff

    move/from16 v5, v24

    const/16 v24, 0xd

    :goto_f
    add-int/lit8 v26, v5, 0x1

    .line 31
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    move/from16 v27, v1

    const v1, 0xd800

    if-lt v5, v1, :cond_18

    and-int/lit16 v1, v5, 0x1fff

    shl-int v1, v1, v24

    or-int/2addr v7, v1

    add-int/lit8 v24, v24, 0xd

    move/from16 v5, v26

    move/from16 v1, v27

    goto :goto_f

    :cond_18
    shl-int v1, v5, v24

    or-int/2addr v7, v1

    move/from16 v1, v26

    goto :goto_10

    :cond_19
    move/from16 v27, v1

    move/from16 v1, v24

    :goto_10
    and-int/lit16 v5, v7, 0xff

    move-object/from16 v24, v3

    and-int/lit16 v3, v7, 0x400

    if-eqz v3, :cond_1a

    add-int/lit8 v3, v21, 0x1

    .line 32
    aput v20, v12, v21

    move/from16 v21, v3

    :cond_1a
    const/16 v3, 0x33

    if-lt v5, v3, :cond_22

    add-int/lit8 v3, v1, 0x1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    move/from16 v26, v3

    const v3, 0xd800

    if-lt v1, v3, :cond_1c

    and-int/lit16 v1, v1, 0x1fff

    move/from16 v3, v26

    const/16 v26, 0xd

    :goto_11
    add-int/lit8 v31, v3, 0x1

    .line 34
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    move/from16 v32, v1

    const v1, 0xd800

    if-lt v3, v1, :cond_1b

    and-int/lit16 v1, v3, 0x1fff

    shl-int v1, v1, v26

    or-int v1, v32, v1

    add-int/lit8 v26, v26, 0xd

    move/from16 v3, v31

    goto :goto_11

    :cond_1b
    shl-int v1, v3, v26

    or-int v1, v32, v1

    move/from16 v3, v31

    goto :goto_12

    :cond_1c
    move/from16 v3, v26

    :goto_12
    move/from16 v26, v1

    add-int/lit8 v1, v5, -0x33

    move/from16 v31, v3

    const/16 v3, 0x9

    if-eq v1, v3, :cond_1e

    const/16 v3, 0x11

    if-ne v1, v3, :cond_1d

    goto :goto_13

    :cond_1d
    const/16 v3, 0xc

    if-ne v1, v3, :cond_1f

    if-nez v10, :cond_1f

    .line 41
    div-int/lit8 v1, v20, 0x3

    add-int/lit8 v3, v16, 0x1

    add-int/2addr v1, v1

    add-int/lit8 v1, v1, 0x1

    .line 36
    aget-object v16, v17, v16

    aput-object v16, v11, v1

    goto :goto_14

    .line 34
    :cond_1e
    :goto_13
    div-int/lit8 v1, v20, 0x3

    add-int/lit8 v3, v16, 0x1

    add-int/2addr v1, v1

    add-int/lit8 v1, v1, 0x1

    .line 35
    aget-object v16, v17, v16

    aput-object v16, v11, v1

    :goto_14
    move/from16 v16, v3

    :cond_1f
    add-int v1, v26, v26

    .line 37
    aget-object v3, v17, v1

    move/from16 v26, v1

    .line 38
    instance-of v1, v3, Ljava/lang/reflect/Field;

    if-eqz v1, :cond_20

    .line 39
    check-cast v3, Ljava/lang/reflect/Field;

    goto :goto_15

    .line 40
    :cond_20
    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/auth/zzfz;->zzA(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 41
    aput-object v3, v17, v26

    :goto_15
    move/from16 v32, v4

    .line 42
    invoke-virtual {v15, v3}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v3

    long-to-int v1, v3

    add-int/lit8 v3, v26, 0x1

    .line 43
    aget-object v4, v17, v3

    move/from16 v26, v1

    .line 44
    instance-of v1, v4, Ljava/lang/reflect/Field;

    if-eqz v1, :cond_21

    .line 45
    check-cast v4, Ljava/lang/reflect/Field;

    goto :goto_16

    .line 46
    :cond_21
    check-cast v4, Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/google/android/gms/internal/auth/zzfz;->zzA(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 47
    aput-object v4, v17, v3

    .line 48
    :goto_16
    invoke-virtual {v15, v4}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v3

    long-to-int v1, v3

    move/from16 v4, v26

    move/from16 v26, v1

    move v1, v4

    move-object/from16 v29, v0

    move/from16 v4, v31

    const/4 v0, 0x0

    goto/16 :goto_21

    :cond_22
    move/from16 v32, v4

    add-int/lit8 v3, v16, 0x1

    .line 49
    aget-object v4, v17, v16

    check-cast v4, Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/google/android/gms/internal/auth/zzfz;->zzA(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    move/from16 v26, v3

    const/16 v3, 0x9

    if-eq v5, v3, :cond_29

    const/16 v3, 0x11

    if-ne v5, v3, :cond_23

    goto :goto_1a

    :cond_23
    const/16 v3, 0x1b

    if-eq v5, v3, :cond_28

    const/16 v3, 0x31

    if-ne v5, v3, :cond_24

    goto :goto_19

    :cond_24
    const/16 v3, 0xc

    if-eq v5, v3, :cond_27

    const/16 v3, 0x1e

    if-eq v5, v3, :cond_27

    const/16 v3, 0x2c

    if-ne v5, v3, :cond_25

    goto :goto_18

    :cond_25
    const/16 v3, 0x32

    if-ne v5, v3, :cond_2a

    add-int/lit8 v3, v22, 0x1

    .line 53
    aput v20, v12, v22

    div-int/lit8 v22, v20, 0x3

    add-int v22, v22, v22

    add-int/lit8 v28, v16, 0x2

    .line 54
    aget-object v26, v17, v26

    aput-object v26, v11, v22

    move/from16 v29, v3

    and-int/lit16 v3, v7, 0x800

    if-eqz v3, :cond_26

    add-int/lit8 v3, v16, 0x3

    add-int/lit8 v22, v22, 0x1

    .line 55
    aget-object v16, v17, v28

    aput-object v16, v11, v22

    move/from16 v16, v3

    goto :goto_17

    :cond_26
    move/from16 v16, v28

    :goto_17
    move/from16 v22, v29

    goto :goto_1b

    :cond_27
    :goto_18
    if-nez v10, :cond_2a

    .line 51
    div-int/lit8 v3, v20, 0x3

    add-int/lit8 v16, v16, 0x2

    add-int/2addr v3, v3

    add-int/lit8 v3, v3, 0x1

    .line 52
    aget-object v26, v17, v26

    aput-object v26, v11, v3

    goto :goto_1b

    .line 63
    :cond_28
    :goto_19
    div-int/lit8 v3, v20, 0x3

    add-int/lit8 v16, v16, 0x2

    add-int/2addr v3, v3

    add-int/lit8 v3, v3, 0x1

    .line 51
    aget-object v26, v17, v26

    aput-object v26, v11, v3

    goto :goto_1b

    .line 49
    :cond_29
    :goto_1a
    div-int/lit8 v3, v20, 0x3

    add-int/2addr v3, v3

    add-int/lit8 v3, v3, 0x1

    .line 50
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v16

    aput-object v16, v11, v3

    :cond_2a
    move/from16 v16, v26

    .line 56
    :goto_1b
    invoke-virtual {v15, v4}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v3

    long-to-int v4, v3

    and-int/lit16 v3, v7, 0x1000

    const v26, 0xfffff

    move/from16 v28, v4

    const/16 v4, 0x1000

    if-ne v3, v4, :cond_2e

    const/16 v3, 0x11

    if-gt v5, v3, :cond_2e

    add-int/lit8 v3, v1, 0x1

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const v4, 0xd800

    if-lt v1, v4, :cond_2c

    and-int/lit16 v1, v1, 0x1fff

    const/16 v25, 0xd

    :goto_1c
    add-int/lit8 v26, v3, 0x1

    .line 58
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-lt v3, v4, :cond_2b

    and-int/lit16 v3, v3, 0x1fff

    shl-int v3, v3, v25

    or-int/2addr v1, v3

    add-int/lit8 v25, v25, 0xd

    move/from16 v3, v26

    goto :goto_1c

    :cond_2b
    shl-int v3, v3, v25

    or-int/2addr v1, v3

    goto :goto_1d

    :cond_2c
    move/from16 v26, v3

    :goto_1d
    add-int v3, v6, v6

    div-int/lit8 v25, v1, 0x20

    add-int v3, v3, v25

    .line 59
    aget-object v4, v17, v3

    move-object/from16 v29, v0

    .line 60
    instance-of v0, v4, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_2d

    .line 61
    check-cast v4, Ljava/lang/reflect/Field;

    goto :goto_1e

    .line 62
    :cond_2d
    check-cast v4, Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/google/android/gms/internal/auth/zzfz;->zzA(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 63
    aput-object v4, v17, v3

    .line 64
    :goto_1e
    invoke-virtual {v15, v4}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v3

    long-to-int v0, v3

    rem-int/lit8 v1, v1, 0x20

    move/from16 v33, v26

    move/from16 v26, v0

    move/from16 v0, v33

    goto :goto_1f

    :cond_2e
    move-object/from16 v29, v0

    move v0, v1

    const/4 v1, 0x0

    :goto_1f
    const/16 v3, 0x12

    if-lt v5, v3, :cond_2f

    const/16 v3, 0x31

    if-gt v5, v3, :cond_2f

    add-int/lit8 v3, v23, 0x1

    .line 65
    aput v28, v12, v23

    move v4, v0

    move v0, v1

    move/from16 v23, v3

    goto :goto_20

    :cond_2f
    move v4, v0

    move v0, v1

    :goto_20
    move/from16 v1, v28

    :goto_21
    add-int/lit8 v3, v20, 0x1

    .line 66
    aput v32, v24, v20

    add-int/lit8 v28, v20, 0x2

    move/from16 v30, v0

    and-int/lit16 v0, v7, 0x200

    if-eqz v0, :cond_30

    const/high16 v0, 0x20000000

    goto :goto_22

    :cond_30
    const/4 v0, 0x0

    :goto_22
    and-int/lit16 v7, v7, 0x100

    if-eqz v7, :cond_31

    const/high16 v7, 0x10000000

    goto :goto_23

    :cond_31
    const/4 v7, 0x0

    :goto_23
    or-int/2addr v0, v7

    shl-int/lit8 v5, v5, 0x14

    or-int/2addr v0, v5

    or-int/2addr v0, v1

    .line 67
    aput v0, v24, v3

    add-int/lit8 v20, v20, 0x3

    shl-int/lit8 v0, v30, 0x14

    or-int v0, v0, v26

    .line 68
    aput v0, v24, v28

    move-object/from16 v3, v24

    move/from16 v1, v27

    move-object/from16 v0, v29

    const v5, 0xd800

    goto/16 :goto_c

    :cond_32
    move-object/from16 v24, v3

    .line 55
    new-instance v4, Lcom/google/android/gms/internal/auth/zzfz;

    .line 69
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/auth/zzgg;->zza()Lcom/google/android/gms/internal/auth/zzfw;

    move-result-object v0

    move-object v6, v11

    const/4 v11, 0x0

    const/16 v20, 0x0

    move v5, v14

    move v14, v13

    move v13, v5

    move-object/from16 v15, p1

    move-object/from16 v16, p2

    move-object/from16 v17, p3

    move-object/from16 v18, p4

    move-object/from16 v19, p5

    move v7, v8

    move v8, v9

    move-object/from16 v5, v24

    move-object v9, v0

    invoke-direct/range {v4 .. v20}, Lcom/google/android/gms/internal/auth/zzfz;-><init>([I[Ljava/lang/Object;IILcom/google/android/gms/internal/auth/zzfw;ZZ[IIILcom/google/android/gms/internal/auth/zzgb;Lcom/google/android/gms/internal/auth/zzfk;Lcom/google/android/gms/internal/auth/zzgy;Lcom/google/android/gms/internal/auth/zzel;Lcom/google/android/gms/internal/auth/zzfr;[B)V

    return-object v4
.end method

.method private static zzl(Ljava/lang/Object;J)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method private final zzm(Ljava/lang/Object;[BIIIJLcom/google/android/gms/internal/auth/zzds;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object p2, Lcom/google/android/gms/internal/auth/zzfz;->zzb:Lsun/misc/Unsafe;

    invoke-direct {p0, p5}, Lcom/google/android/gms/internal/auth/zzfz;->zzz(I)Ljava/lang/Object;

    move-result-object p3

    .line 2
    invoke-virtual {p2, p1, p6, p7}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p4

    .line 3
    move-object p5, p4

    check-cast p5, Lcom/google/android/gms/internal/auth/zzfq;

    invoke-virtual {p5}, Lcom/google/android/gms/internal/auth/zzfq;->zze()Z

    move-result p5

    if-eqz p5, :cond_0

    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfq;->zza()Lcom/google/android/gms/internal/auth/zzfq;

    move-result-object p5

    .line 4
    invoke-virtual {p5}, Lcom/google/android/gms/internal/auth/zzfq;->zzb()Lcom/google/android/gms/internal/auth/zzfq;

    move-result-object p5

    .line 5
    invoke-static {p5, p4}, Lcom/google/android/gms/internal/auth/zzfr;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-virtual {p2, p1, p6, p7, p5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 7
    :goto_0
    check-cast p3, Lcom/google/android/gms/internal/auth/zzfp;

    const/4 p1, 0x0

    .line 8
    throw p1
.end method

.method private final zzn(Ljava/lang/Object;[BIIIIIIIJILcom/google/android/gms/internal/auth/zzds;)I
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v8, p6

    move/from16 v3, p7

    move-wide/from16 v9, p10

    move/from16 v4, p12

    .line 1
    sget-object v11, Lcom/google/android/gms/internal/auth/zzfz;->zzb:Lsun/misc/Unsafe;

    iget-object v5, v0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    add-int/lit8 v6, v4, 0x2

    aget v5, v5, v6

    const v6, 0xfffff

    and-int/2addr v5, v6

    int-to-long v12, v5

    const/4 v14, 0x0

    const/4 v5, 0x5

    const/4 v6, 0x1

    const/4 v7, 0x2

    packed-switch p9, :pswitch_data_0

    :cond_0
    move/from16 v2, p3

    goto/16 :goto_6

    :pswitch_0
    const/4 v5, 0x3

    if-ne v3, v5, :cond_0

    move/from16 v5, p5

    .line 2
    invoke-direct {v0, v4}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v2

    and-int/lit8 v3, v5, -0x8

    or-int/lit8 v6, v3, 0x4

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v7, p13

    .line 3
    invoke-static/range {v2 .. v7}, Lcom/google/android/gms/internal/auth/zzdt;->zzc(Lcom/google/android/gms/internal/auth/zzgh;[BIIILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    move-object v15, v7

    .line 4
    invoke-virtual {v11, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    if-ne v3, v8, :cond_1

    .line 5
    invoke-virtual {v11, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v14

    :cond_1
    if-nez v14, :cond_2

    iget-object v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 6
    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_0

    .line 9
    :cond_2
    iget-object v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 7
    invoke-static {v14, v3}, Lcom/google/android/gms/internal/auth/zzez;->zzg(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 8
    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 9
    :goto_0
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_1
    move-object/from16 v6, p2

    move/from16 v2, p3

    move-object/from16 v15, p13

    if-eqz v3, :cond_3

    goto/16 :goto_6

    .line 10
    :cond_3
    invoke-static {v6, v2, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget-wide v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 11
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzei;->zzc(J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 12
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_2
    move-object/from16 v6, p2

    move/from16 v2, p3

    move-object/from16 v15, p13

    if-eqz v3, :cond_4

    goto/16 :goto_6

    .line 13
    :cond_4
    invoke-static {v6, v2, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 14
    invoke-static {v3}, Lcom/google/android/gms/internal/auth/zzei;->zzb(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 15
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_3
    move-object/from16 v6, p2

    move/from16 v2, p3

    move/from16 v5, p5

    move-object/from16 v15, p13

    if-nez v3, :cond_14

    .line 16
    invoke-static {v6, v2, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 17
    invoke-direct {v0, v4}, Lcom/google/android/gms/internal/auth/zzfz;->zzx(I)Lcom/google/android/gms/internal/auth/zzex;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 18
    invoke-interface {v4}, Lcom/google/android/gms/internal/auth/zzex;->zza()Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_1

    .line 21
    :cond_5
    invoke-static {v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/auth/zzgz;

    move-result-object v1

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v5, v3}, Lcom/google/android/gms/internal/auth/zzgz;->zzf(ILjava/lang/Object;)V

    return v2

    .line 19
    :cond_6
    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 20
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_4
    move-object/from16 v6, p2

    move/from16 v2, p3

    move-object/from16 v15, p13

    if-eq v3, v7, :cond_7

    goto/16 :goto_6

    .line 22
    :cond_7
    invoke-static {v6, v2, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zza([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget-object v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 23
    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 24
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_5
    move-object/from16 v6, p2

    move/from16 v2, p3

    move-object/from16 v15, p13

    if-ne v3, v7, :cond_14

    .line 25
    invoke-direct {v0, v4}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v3

    move/from16 v5, p4

    .line 26
    invoke-static {v3, v6, v2, v5, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zzd(Lcom/google/android/gms/internal/auth/zzgh;[BIILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    .line 27
    invoke-virtual {v11, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    if-ne v3, v8, :cond_8

    .line 28
    invoke-virtual {v11, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v14

    :cond_8
    if-nez v14, :cond_9

    iget-object v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 29
    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_2

    .line 32
    :cond_9
    iget-object v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 30
    invoke-static {v14, v3}, Lcom/google/android/gms/internal/auth/zzez;->zzg(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 31
    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 32
    :goto_2
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_6
    move-object/from16 v6, p2

    move/from16 v2, p3

    move-object/from16 v15, p13

    if-ne v3, v7, :cond_14

    .line 33
    invoke-static {v6, v2, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-nez v3, :cond_a

    const-string v3, ""

    .line 34
    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_4

    :cond_a
    const/high16 v4, 0x20000000

    and-int v4, p8, v4

    if-eqz v4, :cond_c

    add-int v4, v2, v3

    .line 35
    invoke-static {v6, v2, v4}, Lcom/google/android/gms/internal/auth/zzhm;->zzd([BII)Z

    move-result v4

    if-eqz v4, :cond_b

    goto :goto_3

    .line 39
    :cond_b
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzb()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object v1

    throw v1

    .line 35
    :cond_c
    :goto_3
    new-instance v4, Ljava/lang/String;

    .line 36
    sget-object v5, Lcom/google/android/gms/internal/auth/zzez;->zzb:Ljava/nio/charset/Charset;

    invoke-direct {v4, v6, v2, v3, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 37
    invoke-virtual {v11, v1, v9, v10, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/2addr v2, v3

    .line 38
    :goto_4
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_7
    move-object/from16 v4, p2

    move/from16 v2, p3

    move-object/from16 v15, p13

    if-nez v3, :cond_14

    .line 40
    invoke-static {v4, v2, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget-wide v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    const-wide/16 v14, 0x0

    cmp-long v5, v3, v14

    if-eqz v5, :cond_d

    goto :goto_5

    :cond_d
    const/4 v6, 0x0

    .line 41
    :goto_5
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 42
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_8
    move-object/from16 v4, p2

    move/from16 v2, p3

    if-eq v3, v5, :cond_e

    goto/16 :goto_6

    .line 43
    :cond_e
    invoke-static/range {p2 .. p3}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 44
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v1, v2, 0x4

    return v1

    :pswitch_9
    move-object/from16 v4, p2

    move/from16 v2, p3

    if-eq v3, v6, :cond_f

    goto/16 :goto_6

    .line 45
    :cond_f
    invoke-static/range {p2 .. p3}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v1, v2, 0x8

    return v1

    :pswitch_a
    move-object/from16 v4, p2

    move/from16 v2, p3

    move-object/from16 v15, p13

    if-eqz v3, :cond_10

    goto :goto_6

    .line 47
    :cond_10
    invoke-static {v4, v2, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 48
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 49
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_b
    move-object/from16 v4, p2

    move/from16 v2, p3

    move-object/from16 v15, p13

    if-eqz v3, :cond_11

    goto :goto_6

    .line 50
    :cond_11
    invoke-static {v4, v2, v15}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget-wide v3, v15, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 51
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 52
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_c
    move-object/from16 v4, p2

    move/from16 v2, p3

    if-eq v3, v5, :cond_12

    goto :goto_6

    .line 53
    :cond_12
    invoke-static/range {p2 .. p3}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    .line 54
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 55
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v1, v2, 0x4

    return v1

    :pswitch_d
    move-object/from16 v4, p2

    move/from16 v2, p3

    if-eq v3, v6, :cond_13

    goto :goto_6

    .line 56
    :cond_13
    invoke-static/range {p2 .. p3}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v3

    .line 57
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 58
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v1, v2, 0x8

    return v1

    :cond_14
    :goto_6
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x33
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final zzo(Ljava/lang/Object;[BIILcom/google/android/gms/internal/auth/zzds;)I
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v7, p2

    move/from16 v8, p4

    move-object/from16 v13, p5

    .line 1
    sget-object v2, Lcom/google/android/gms/internal/auth/zzfz;->zzb:Lsun/misc/Unsafe;

    const/16 v16, 0x0

    const/4 v9, -0x1

    move/from16 v3, p3

    const/4 v4, -0x1

    const/4 v5, 0x0

    const v10, 0xfffff

    const/4 v11, 0x0

    :goto_0
    if-ge v3, v8, :cond_16

    add-int/lit8 v6, v3, 0x1

    aget-byte v3, v7, v3

    if-gez v3, :cond_0

    .line 2
    invoke-static {v3, v7, v6, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzk(I[BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v6

    iget v3, v13, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    :cond_0
    move v12, v6

    ushr-int/lit8 v14, v3, 0x3

    and-int/lit8 v6, v3, 0x7

    if-le v14, v4, :cond_1

    div-int/lit8 v5, v5, 0x3

    .line 3
    invoke-direct {v0, v14, v5}, Lcom/google/android/gms/internal/auth/zzfz;->zzr(II)I

    move-result v4

    goto :goto_1

    .line 4
    :cond_1
    invoke-direct {v0, v14}, Lcom/google/android/gms/internal/auth/zzfz;->zzq(I)I

    move-result v4

    :goto_1
    if-ne v4, v9, :cond_2

    move-object v9, v1

    move-object/from16 v24, v2

    move v2, v3

    move v6, v14

    const/4 v8, 0x0

    const/16 v18, -0x1

    goto/16 :goto_11

    .line 51
    :cond_2
    iget-object v5, v0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    add-int/lit8 v17, v4, 0x1

    .line 5
    aget v9, v5, v17

    const v17, 0xfffff

    invoke-static {v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzu(I)I

    move-result v15

    move/from16 p3, v3

    and-int v3, v9, v17

    move/from16 v19, v4

    int-to-long v3, v3

    move-wide/from16 v20, v3

    const/16 v3, 0x11

    if-gt v15, v3, :cond_b

    add-int/lit8 v3, v19, 0x2

    .line 6
    aget v3, v5, v3

    ushr-int/lit8 v5, v3, 0x14

    const/4 v4, 0x1

    shl-int v22, v4, v5

    and-int v3, v3, v17

    if-eq v3, v10, :cond_5

    const v5, 0xfffff

    if-eq v10, v5, :cond_3

    int-to-long v4, v10

    .line 7
    invoke-virtual {v2, v1, v4, v5, v11}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    const v5, 0xfffff

    :cond_3
    if-eq v3, v5, :cond_4

    int-to-long v4, v3

    .line 8
    invoke-virtual {v2, v1, v4, v5}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v11

    :cond_4
    move v10, v3

    :cond_5
    const/4 v3, 0x5

    packed-switch v15, :pswitch_data_0

    :cond_6
    move/from16 v15, v19

    goto/16 :goto_a

    :pswitch_0
    if-nez v6, :cond_6

    .line 9
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v9

    iget-wide v3, v13, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 10
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzei;->zzc(J)J

    move-result-wide v5

    move-object v3, v2

    move-object v2, v1

    move-object v1, v3

    move/from16 v15, v19

    move-wide/from16 v3, v20

    .line 11
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object/from16 v25, v2

    move-object v2, v1

    move-object/from16 v1, v25

    or-int v11, v11, v22

    move v3, v9

    goto/16 :goto_9

    :pswitch_1
    move/from16 v15, v19

    move-wide/from16 v4, v20

    if-nez v6, :cond_a

    .line 12
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    iget v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 13
    invoke-static {v6}, Lcom/google/android/gms/internal/auth/zzei;->zzb(I)I

    move-result v6

    .line 14
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_2

    :pswitch_2
    move/from16 v15, v19

    move-wide/from16 v4, v20

    if-nez v6, :cond_a

    .line 15
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    iget v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 16
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_2

    :pswitch_3
    move/from16 v15, v19

    move-wide/from16 v4, v20

    const/4 v3, 0x2

    if-ne v6, v3, :cond_a

    .line 17
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zza([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    iget-object v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 18
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_2
    or-int v11, v11, v22

    goto/16 :goto_9

    :pswitch_4
    move/from16 v15, v19

    move-wide/from16 v4, v20

    const/4 v3, 0x2

    if-ne v6, v3, :cond_a

    .line 19
    invoke-direct {v0, v15}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v3

    .line 20
    invoke-static {v3, v7, v12, v8, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzd(Lcom/google/android/gms/internal/auth/zzgh;[BIILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    .line 21
    invoke-virtual {v2, v1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_7

    iget-object v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 22
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_2

    :cond_7
    iget-object v9, v13, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 23
    invoke-static {v6, v9}, Lcom/google/android/gms/internal/auth/zzez;->zzg(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 24
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_2

    :pswitch_5
    move/from16 v15, v19

    move-wide/from16 v4, v20

    const/4 v3, 0x2

    if-ne v6, v3, :cond_a

    const/high16 v3, 0x20000000

    and-int/2addr v3, v9

    if-nez v3, :cond_8

    .line 25
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzg([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    goto :goto_3

    .line 26
    :cond_8
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzh([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    .line 25
    :goto_3
    iget-object v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 27
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_2

    :pswitch_6
    move/from16 v15, v19

    move-wide/from16 v4, v20

    if-nez v6, :cond_a

    .line 28
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    iget-wide v8, v13, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    const-wide/16 v19, 0x0

    cmp-long v6, v8, v19

    if-eqz v6, :cond_9

    const/4 v6, 0x1

    goto :goto_4

    :cond_9
    const/4 v6, 0x0

    .line 29
    :goto_4
    invoke-static {v1, v4, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzk(Ljava/lang/Object;JZ)V

    goto/16 :goto_8

    :pswitch_7
    move/from16 v15, v19

    move-wide/from16 v4, v20

    if-ne v6, v3, :cond_a

    .line 30
    invoke-static {v7, v12}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result v3

    invoke-virtual {v2, v1, v4, v5, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_6

    :pswitch_8
    move/from16 v15, v19

    move-wide/from16 v4, v20

    const/4 v3, 0x1

    if-ne v6, v3, :cond_a

    move-wide v3, v4

    .line 31
    invoke-static {v7, v12}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v5

    move-object/from16 v25, v2

    move-object v2, v1

    move-object/from16 v1, v25

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object/from16 v25, v2

    move-object v2, v1

    move-object/from16 v1, v25

    goto/16 :goto_7

    :pswitch_9
    move/from16 v15, v19

    move-wide/from16 v3, v20

    if-nez v6, :cond_a

    .line 32
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v5

    iget v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 33
    invoke-virtual {v2, v1, v3, v4, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    or-int v11, v11, v22

    move/from16 v8, p4

    move v3, v5

    goto :goto_9

    :pswitch_a
    move/from16 v15, v19

    move-wide/from16 v3, v20

    if-nez v6, :cond_a

    .line 34
    invoke-static {v7, v12, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v8

    iget-wide v5, v13, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    move-object/from16 v25, v2

    move-object v2, v1

    move-object/from16 v1, v25

    .line 35
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object/from16 v25, v2

    move-object v2, v1

    move-object/from16 v1, v25

    or-int v11, v11, v22

    move v3, v8

    move v4, v14

    move v5, v15

    :goto_5
    const/4 v9, -0x1

    goto/16 :goto_d

    :pswitch_b
    move/from16 v15, v19

    move-wide/from16 v4, v20

    if-ne v6, v3, :cond_a

    .line 36
    invoke-static {v7, v12}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    .line 37
    invoke-static {v1, v4, v5, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzm(Ljava/lang/Object;JF)V

    :goto_6
    add-int/lit8 v3, v12, 0x4

    goto :goto_8

    :pswitch_c
    move/from16 v15, v19

    move-wide/from16 v4, v20

    const/4 v3, 0x1

    if-ne v6, v3, :cond_a

    .line 38
    invoke-static {v7, v12}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v8

    .line 39
    invoke-static {v1, v4, v5, v8, v9}, Lcom/google/android/gms/internal/auth/zzhi;->zzl(Ljava/lang/Object;JD)V

    :goto_7
    add-int/lit8 v3, v12, 0x8

    :goto_8
    or-int v11, v11, v22

    move/from16 v8, p4

    :goto_9
    move v4, v14

    move v5, v15

    const/4 v9, -0x1

    goto/16 :goto_0

    :cond_a
    :goto_a
    move-object v9, v1

    move-object/from16 v24, v2

    move v6, v14

    move v8, v15

    const/16 v18, -0x1

    move/from16 v2, p3

    goto/16 :goto_11

    :cond_b
    move/from16 v8, v19

    move-wide/from16 v4, v20

    const/16 v3, 0x1b

    if-ne v15, v3, :cond_f

    const/4 v3, 0x2

    if-ne v6, v3, :cond_e

    .line 40
    invoke-virtual {v2, v1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/auth/zzey;

    .line 41
    invoke-interface {v3}, Lcom/google/android/gms/internal/auth/zzey;->zzc()Z

    move-result v6

    if-nez v6, :cond_d

    .line 42
    invoke-interface {v3}, Lcom/google/android/gms/internal/auth/zzey;->size()I

    move-result v6

    if-nez v6, :cond_c

    const/16 v6, 0xa

    goto :goto_b

    :cond_c
    add-int/2addr v6, v6

    .line 43
    :goto_b
    invoke-interface {v3, v6}, Lcom/google/android/gms/internal/auth/zzey;->zzd(I)Lcom/google/android/gms/internal/auth/zzey;

    move-result-object v3

    .line 44
    invoke-virtual {v2, v1, v4, v5, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_d
    move-object v6, v3

    .line 45
    invoke-direct {v0, v8}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v1

    move/from16 v5, p4

    move-object v3, v7

    move v4, v12

    move-object v7, v13

    move-object v12, v2

    move/from16 v2, p3

    .line 46
    invoke-static/range {v1 .. v7}, Lcom/google/android/gms/internal/auth/zzdt;->zze(Lcom/google/android/gms/internal/auth/zzgh;I[BIILcom/google/android/gms/internal/auth/zzey;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result v1

    move-object/from16 v7, p2

    move-object/from16 v13, p5

    move v3, v1

    move v5, v8

    move-object v2, v12

    move v4, v14

    const/4 v9, -0x1

    move-object/from16 v1, p1

    goto/16 :goto_d

    :cond_e
    move v3, v12

    move-object v12, v2

    move v15, v10

    move/from16 v23, v11

    move-object/from16 v24, v12

    move v10, v14

    const/16 v18, -0x1

    move/from16 v11, p3

    goto/16 :goto_e

    :cond_f
    move v3, v12

    move-object v12, v2

    move/from16 v2, p3

    const/16 v1, 0x31

    if-gt v15, v1, :cond_11

    move v1, v10

    int-to-long v9, v9

    move v7, v6

    move/from16 v23, v11

    move-object/from16 v24, v12

    move v6, v14

    move v11, v15

    const/16 v18, -0x1

    move-object/from16 v14, p5

    move v15, v1

    move-wide v12, v4

    move-object/from16 v1, p1

    move/from16 v4, p4

    move v5, v2

    move-object/from16 v2, p2

    .line 47
    invoke-direct/range {v0 .. v14}, Lcom/google/android/gms/internal/auth/zzfz;->zzp(Ljava/lang/Object;[BIIIIIIJIJLcom/google/android/gms/internal/auth/zzds;)I

    move-result v7

    move v11, v5

    move v10, v6

    if-eq v7, v3, :cond_10

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v13, p5

    move v3, v7

    move v5, v8

    move v4, v10

    :goto_c
    move v10, v15

    move/from16 v11, v23

    move-object/from16 v2, v24

    const/4 v9, -0x1

    move-object/from16 v7, p2

    :goto_d
    move/from16 v8, p4

    goto/16 :goto_0

    :cond_10
    move-object/from16 v9, p1

    move v12, v7

    goto :goto_f

    :cond_11
    move v7, v6

    move/from16 v23, v11

    move-object/from16 v24, v12

    const/16 v18, -0x1

    move v11, v2

    move v12, v8

    move v8, v9

    move v9, v15

    move v15, v10

    move v10, v14

    const/16 v0, 0x32

    if-ne v9, v0, :cond_14

    const/4 v0, 0x2

    if-ne v7, v0, :cond_13

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v8, p5

    move-wide v6, v4

    move v5, v12

    move/from16 v4, p4

    .line 48
    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/auth/zzfz;->zzm(Ljava/lang/Object;[BIIIJLcom/google/android/gms/internal/auth/zzds;)I

    move-result v6

    move v8, v5

    if-eq v6, v3, :cond_12

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v7, p2

    move-object/from16 v13, p5

    move v3, v6

    move v5, v8

    move v4, v10

    move v10, v15

    move/from16 v11, v23

    move-object/from16 v2, v24

    goto/16 :goto_5

    :cond_12
    move-object/from16 v9, p1

    move v12, v6

    goto :goto_f

    :cond_13
    move v8, v12

    :goto_e
    move-object/from16 v9, p1

    move v12, v3

    :goto_f
    move v6, v10

    move v2, v11

    :goto_10
    move v10, v15

    move/from16 v11, v23

    goto :goto_11

    :cond_14
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v13, p5

    move v6, v10

    move-wide/from16 v25, v4

    move/from16 v4, p4

    move v5, v11

    move-wide/from16 v10, v25

    .line 49
    invoke-direct/range {v0 .. v13}, Lcom/google/android/gms/internal/auth/zzfz;->zzn(Ljava/lang/Object;[BIIIIIIIJILcom/google/android/gms/internal/auth/zzds;)I

    move-result v7

    move-object v9, v1

    move v2, v5

    move v8, v12

    if-eq v7, v3, :cond_15

    move-object/from16 v0, p0

    move-object/from16 v13, p5

    move v4, v6

    move v3, v7

    move v5, v8

    move-object v1, v9

    goto :goto_c

    :cond_15
    move v12, v7

    goto :goto_10

    .line 50
    :goto_11
    invoke-static {v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/auth/zzgz;

    move-result-object v4

    move-object/from16 v1, p2

    move/from16 v3, p4

    move-object/from16 v5, p5

    move v0, v2

    move v2, v12

    .line 51
    invoke-static/range {v0 .. v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzi(I[BIILcom/google/android/gms/internal/auth/zzgz;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result v0

    move-object/from16 v7, p2

    move-object/from16 v13, p5

    move v4, v6

    move v5, v8

    move-object v1, v9

    move-object/from16 v2, v24

    const/4 v9, -0x1

    move v8, v3

    move v3, v0

    move-object/from16 v0, p0

    goto/16 :goto_0

    :cond_16
    move-object v9, v1

    move-object/from16 v24, v2

    move v4, v8

    move v15, v10

    move/from16 v23, v11

    const v5, 0xfffff

    if-eq v15, v5, :cond_17

    int-to-long v0, v15

    move/from16 v11, v23

    move-object/from16 v2, v24

    .line 52
    invoke-virtual {v2, v9, v0, v1, v11}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_17
    if-ne v3, v4, :cond_18

    return v3

    .line 53
    :cond_18
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzd()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object v0

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final zzp(Ljava/lang/Object;[BIIIIIIJIJLcom/google/android/gms/internal/auth/zzds;)I
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v0, p5

    move/from16 v4, p7

    move/from16 v6, p8

    move-wide/from16 v7, p12

    move-object/from16 v5, p14

    .line 1
    sget-object v9, Lcom/google/android/gms/internal/auth/zzfz;->zzb:Lsun/misc/Unsafe;

    invoke-virtual {v9, p1, v7, v8}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/auth/zzey;

    .line 2
    invoke-interface {v10}, Lcom/google/android/gms/internal/auth/zzey;->zzc()Z

    move-result v11

    if-nez v11, :cond_1

    .line 3
    invoke-interface {v10}, Lcom/google/android/gms/internal/auth/zzey;->size()I

    move-result v11

    if-nez v11, :cond_0

    const/16 v11, 0xa

    goto :goto_0

    :cond_0
    add-int/2addr v11, v11

    .line 4
    :goto_0
    invoke-interface {v10, v11}, Lcom/google/android/gms/internal/auth/zzey;->zzd(I)Lcom/google/android/gms/internal/auth/zzey;

    move-result-object v10

    .line 5
    invoke-virtual {v9, p1, v7, v8, v10}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_1
    const/4 v7, 0x5

    const-wide/16 v8, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x2

    packed-switch p11, :pswitch_data_0

    const/4 p1, 0x3

    if-ne v4, p1, :cond_4a

    .line 6
    invoke-direct {p0, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object p1

    and-int/lit8 v4, v0, -0x8

    or-int/lit8 v4, v4, 0x4

    move-object/from16 p6, p1

    move-object/from16 p7, p2

    move/from16 p8, v2

    move/from16 p9, v3

    move/from16 p10, v4

    move-object/from16 p11, v5

    .line 7
    invoke-static/range {p6 .. p11}, Lcom/google/android/gms/internal/auth/zzdt;->zzc(Lcom/google/android/gms/internal/auth/zzgh;[BIIILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    move-object/from16 v2, p6

    iget-object v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 8
    invoke-interface {v10, v6}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto/16 :goto_24

    :pswitch_0
    if-ne v4, v12, :cond_4

    .line 12
    check-cast v10, Lcom/google/android/gms/internal/auth/zzfl;

    .line 13
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v0, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    add-int/2addr v0, p1

    :goto_1
    if-ge p1, v0, :cond_2

    .line 14
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget-wide v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 15
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/auth/zzei;->zzc(J)J

    move-result-wide v2

    invoke-virtual {v10, v2, v3}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    goto :goto_1

    :cond_2
    if-ne p1, v0, :cond_3

    return p1

    .line 16
    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_4
    if-nez v4, :cond_4a

    .line 17
    check-cast v10, Lcom/google/android/gms/internal/auth/zzfl;

    .line 18
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget-wide v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 19
    invoke-static {v6, v7}, Lcom/google/android/gms/internal/auth/zzei;->zzc(J)J

    move-result-wide v6

    invoke-virtual {v10, v6, v7}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    :goto_2
    if-ge p1, v3, :cond_6

    .line 20
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v4, :cond_5

    goto :goto_3

    .line 21
    :cond_5
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget-wide v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    invoke-static {v6, v7}, Lcom/google/android/gms/internal/auth/zzei;->zzc(J)J

    move-result-wide v6

    .line 22
    invoke-virtual {v10, v6, v7}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    goto :goto_2

    :cond_6
    :goto_3
    return p1

    :pswitch_1
    if-ne v4, v12, :cond_9

    .line 23
    check-cast v10, Lcom/google/android/gms/internal/auth/zzev;

    .line 24
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v0, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    add-int/2addr v0, p1

    :goto_4
    if-ge p1, v0, :cond_7

    .line 25
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 26
    invoke-static {v2}, Lcom/google/android/gms/internal/auth/zzei;->zzb(I)I

    move-result v2

    invoke-virtual {v10, v2}, Lcom/google/android/gms/internal/auth/zzev;->zze(I)V

    goto :goto_4

    :cond_7
    if-ne p1, v0, :cond_8

    return p1

    .line 27
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_9
    if-nez v4, :cond_4a

    .line 28
    check-cast v10, Lcom/google/android/gms/internal/auth/zzev;

    .line 29
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 30
    invoke-static {v2}, Lcom/google/android/gms/internal/auth/zzei;->zzb(I)I

    move-result v2

    invoke-virtual {v10, v2}, Lcom/google/android/gms/internal/auth/zzev;->zze(I)V

    :goto_5
    if-ge p1, v3, :cond_b

    .line 31
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v4, :cond_a

    goto :goto_6

    .line 32
    :cond_a
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    invoke-static {v2}, Lcom/google/android/gms/internal/auth/zzei;->zzb(I)I

    move-result v2

    .line 33
    invoke-virtual {v10, v2}, Lcom/google/android/gms/internal/auth/zzev;->zze(I)V

    goto :goto_5

    :cond_b
    :goto_6
    return p1

    :pswitch_2
    if-ne v4, v12, :cond_c

    .line 34
    invoke-static {p2, v2, v10, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzf([BILcom/google/android/gms/internal/auth/zzey;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result v0

    goto :goto_7

    :cond_c
    if-nez v4, :cond_4a

    move-object v1, p2

    move-object v4, v10

    .line 35
    invoke-static/range {v0 .. v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzl(I[BIILcom/google/android/gms/internal/auth/zzey;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result v0

    .line 36
    :goto_7
    check-cast p1, Lcom/google/android/gms/internal/auth/zzeu;

    iget-object v1, p1, Lcom/google/android/gms/internal/auth/zzeu;->zzc:Lcom/google/android/gms/internal/auth/zzgz;

    invoke-static {}, Lcom/google/android/gms/internal/auth/zzgz;->zza()Lcom/google/android/gms/internal/auth/zzgz;

    move-result-object v2

    if-ne v1, v2, :cond_d

    const/4 v1, 0x0

    .line 37
    :cond_d
    invoke-direct {p0, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzx(I)Lcom/google/android/gms/internal/auth/zzex;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzm:Lcom/google/android/gms/internal/auth/zzgy;

    move/from16 v4, p6

    .line 38
    invoke-static {v4, v10, v2, v1, v3}, Lcom/google/android/gms/internal/auth/zzgj;->zzd(ILjava/util/List;Lcom/google/android/gms/internal/auth/zzex;Ljava/lang/Object;Lcom/google/android/gms/internal/auth/zzgy;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_e

    return v0

    :cond_e
    check-cast v1, Lcom/google/android/gms/internal/auth/zzgz;

    .line 39
    iput-object v1, p1, Lcom/google/android/gms/internal/auth/zzeu;->zzc:Lcom/google/android/gms/internal/auth/zzgz;

    return v0

    :pswitch_3
    if-ne v4, v12, :cond_4a

    .line 40
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-ltz v2, :cond_16

    .line 42
    array-length v4, p2

    sub-int/2addr v4, p1

    if-gt v2, v4, :cond_15

    if-nez v2, :cond_f

    .line 44
    sget-object v2, Lcom/google/android/gms/internal/auth/zzee;->zzb:Lcom/google/android/gms/internal/auth/zzee;

    invoke-interface {v10, v2}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 45
    :cond_f
    invoke-static {p2, p1, v2}, Lcom/google/android/gms/internal/auth/zzee;->zzk([BII)Lcom/google/android/gms/internal/auth/zzee;

    move-result-object v4

    invoke-interface {v10, v4}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    :goto_8
    add-int/2addr p1, v2

    :goto_9
    if-ge p1, v3, :cond_14

    .line 46
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v4, :cond_10

    goto :goto_a

    .line 47
    :cond_10
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-ltz v2, :cond_13

    .line 48
    array-length v4, p2

    sub-int/2addr v4, p1

    if-gt v2, v4, :cond_12

    if-nez v2, :cond_11

    .line 52
    sget-object v2, Lcom/google/android/gms/internal/auth/zzee;->zzb:Lcom/google/android/gms/internal/auth/zzee;

    .line 49
    invoke-interface {v10, v2}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 50
    :cond_11
    invoke-static {p2, p1, v2}, Lcom/google/android/gms/internal/auth/zzee;->zzk([BII)Lcom/google/android/gms/internal/auth/zzee;

    move-result-object v4

    invoke-interface {v10, v4}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 52
    :cond_12
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    .line 51
    :cond_13
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzc()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_14
    :goto_a
    return p1

    .line 43
    :cond_15
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    .line 41
    :cond_16
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzc()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :pswitch_4
    if-eq v4, v12, :cond_17

    goto/16 :goto_26

    .line 53
    :cond_17
    invoke-direct {p0, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object p1

    move-object/from16 p6, p1

    move-object/from16 p8, p2

    move/from16 p7, v0

    move/from16 p9, v2

    move/from16 p10, v3

    move-object/from16 p12, v5

    move-object/from16 p11, v10

    .line 54
    invoke-static/range {p6 .. p12}, Lcom/google/android/gms/internal/auth/zzdt;->zze(Lcom/google/android/gms/internal/auth/zzgh;I[BIILcom/google/android/gms/internal/auth/zzey;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    return p1

    :pswitch_5
    if-ne v4, v12, :cond_4a

    const-wide/32 v6, 0x20000000

    and-long v6, p9, v6

    const-string p1, ""

    cmp-long v4, v6, v8

    if-nez v4, :cond_1d

    .line 70
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-ltz v4, :cond_1c

    if-nez v4, :cond_18

    .line 72
    invoke-interface {v10, p1}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 79
    :cond_18
    new-instance v6, Ljava/lang/String;

    .line 73
    sget-object v7, Lcom/google/android/gms/internal/auth/zzez;->zzb:Ljava/nio/charset/Charset;

    invoke-direct {v6, p2, v2, v4, v7}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 74
    invoke-interface {v10, v6}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    :goto_b
    add-int/2addr v2, v4

    :goto_c
    if-ge v2, v3, :cond_1b

    .line 75
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v4

    iget v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-ne v0, v6, :cond_1b

    .line 76
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-ltz v4, :cond_1a

    if-nez v4, :cond_19

    .line 77
    invoke-interface {v10, p1}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_19
    new-instance v6, Ljava/lang/String;

    .line 78
    sget-object v7, Lcom/google/android/gms/internal/auth/zzez;->zzb:Ljava/nio/charset/Charset;

    invoke-direct {v6, p2, v2, v4, v7}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 79
    invoke-interface {v10, v6}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 80
    :cond_1a
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzc()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_1b
    return v2

    .line 71
    :cond_1c
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzc()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    .line 55
    :cond_1d
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-ltz v4, :cond_24

    if-nez v4, :cond_1e

    .line 57
    invoke-interface {v10, p1}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :cond_1e
    add-int v6, v2, v4

    .line 58
    invoke-static {p2, v2, v6}, Lcom/google/android/gms/internal/auth/zzhm;->zzd([BII)Z

    move-result v7

    if-eqz v7, :cond_23

    .line 59
    new-instance v7, Ljava/lang/String;

    .line 60
    sget-object v8, Lcom/google/android/gms/internal/auth/zzez;->zzb:Ljava/nio/charset/Charset;

    invoke-direct {v7, p2, v2, v4, v8}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 61
    invoke-interface {v10, v7}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    :goto_d
    move v2, v6

    :goto_e
    if-ge v2, v3, :cond_22

    .line 62
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v4

    iget v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-ne v0, v6, :cond_22

    .line 63
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-ltz v4, :cond_21

    if-nez v4, :cond_1f

    .line 64
    invoke-interface {v10, p1}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :cond_1f
    add-int v6, v2, v4

    .line 65
    invoke-static {p2, v2, v6}, Lcom/google/android/gms/internal/auth/zzhm;->zzd([BII)Z

    move-result v7

    if-eqz v7, :cond_20

    .line 69
    new-instance v7, Ljava/lang/String;

    .line 66
    sget-object v8, Lcom/google/android/gms/internal/auth/zzez;->zzb:Ljava/nio/charset/Charset;

    invoke-direct {v7, p2, v2, v4, v8}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 67
    invoke-interface {v10, v7}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 69
    :cond_20
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzb()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    .line 68
    :cond_21
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzc()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_22
    return v2

    .line 59
    :cond_23
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzb()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    .line 56
    :cond_24
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzc()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :pswitch_6
    const/4 p1, 0x0

    if-ne v4, v12, :cond_28

    .line 81
    check-cast v10, Lcom/google/android/gms/internal/auth/zzdu;

    .line 82
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v0

    iget v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    add-int/2addr v2, v0

    :goto_f
    if-ge v0, v2, :cond_26

    .line 83
    invoke-static {p2, v0, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v0

    iget-wide v3, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    cmp-long v6, v3, v8

    if-eqz v6, :cond_25

    const/4 v3, 0x1

    goto :goto_10

    :cond_25
    const/4 v3, 0x0

    .line 84
    :goto_10
    invoke-virtual {v10, v3}, Lcom/google/android/gms/internal/auth/zzdu;->zze(Z)V

    goto :goto_f

    :cond_26
    if-ne v0, v2, :cond_27

    return v0

    .line 85
    :cond_27
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_28
    if-nez v4, :cond_4a

    .line 86
    check-cast v10, Lcom/google/android/gms/internal/auth/zzdu;

    .line 87
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget-wide v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    cmp-long v4, v6, v8

    if-eqz v4, :cond_29

    const/4 v4, 0x1

    goto :goto_11

    :cond_29
    const/4 v4, 0x0

    .line 88
    :goto_11
    invoke-virtual {v10, v4}, Lcom/google/android/gms/internal/auth/zzdu;->zze(Z)V

    :goto_12
    if-ge v2, v3, :cond_2c

    .line 89
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v4

    iget v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v6, :cond_2a

    goto :goto_14

    .line 90
    :cond_2a
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget-wide v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    cmp-long v4, v6, v8

    if-eqz v4, :cond_2b

    const/4 v4, 0x1

    goto :goto_13

    :cond_2b
    const/4 v4, 0x0

    .line 91
    :goto_13
    invoke-virtual {v10, v4}, Lcom/google/android/gms/internal/auth/zzdu;->zze(Z)V

    goto :goto_12

    :cond_2c
    :goto_14
    return v2

    :pswitch_7
    if-ne v4, v12, :cond_2f

    .line 92
    check-cast v10, Lcom/google/android/gms/internal/auth/zzev;

    .line 93
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v0, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    add-int/2addr v0, p1

    :goto_15
    if-ge p1, v0, :cond_2d

    .line 94
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result v2

    invoke-virtual {v10, v2}, Lcom/google/android/gms/internal/auth/zzev;->zze(I)V

    add-int/lit8 p1, p1, 0x4

    goto :goto_15

    :cond_2d
    if-ne p1, v0, :cond_2e

    return p1

    .line 95
    :cond_2e
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_2f
    if-ne v4, v7, :cond_4a

    .line 96
    check-cast v10, Lcom/google/android/gms/internal/auth/zzev;

    .line 97
    invoke-static/range {p2 .. p3}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result p1

    invoke-virtual {v10, p1}, Lcom/google/android/gms/internal/auth/zzev;->zze(I)V

    :goto_16
    add-int/lit8 p1, v2, 0x4

    if-ge p1, v3, :cond_31

    .line 98
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v4, :cond_30

    goto :goto_17

    .line 99
    :cond_30
    invoke-static {p2, v2}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result p1

    invoke-virtual {v10, p1}, Lcom/google/android/gms/internal/auth/zzev;->zze(I)V

    goto :goto_16

    :cond_31
    :goto_17
    return p1

    :pswitch_8
    if-ne v4, v12, :cond_34

    .line 100
    check-cast v10, Lcom/google/android/gms/internal/auth/zzfl;

    .line 101
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v0, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    add-int/2addr v0, p1

    :goto_18
    if-ge p1, v0, :cond_32

    .line 102
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v2

    invoke-virtual {v10, v2, v3}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    add-int/lit8 p1, p1, 0x8

    goto :goto_18

    :cond_32
    if-ne p1, v0, :cond_33

    return p1

    .line 103
    :cond_33
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_34
    if-ne v4, v11, :cond_4a

    .line 104
    check-cast v10, Lcom/google/android/gms/internal/auth/zzfl;

    .line 105
    invoke-static/range {p2 .. p3}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v6

    invoke-virtual {v10, v6, v7}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    :goto_19
    add-int/lit8 p1, v2, 0x8

    if-ge p1, v3, :cond_36

    .line 106
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v4, :cond_35

    goto :goto_1a

    .line 107
    :cond_35
    invoke-static {p2, v2}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v6

    invoke-virtual {v10, v6, v7}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    goto :goto_19

    :cond_36
    :goto_1a
    return p1

    :pswitch_9
    if-ne v4, v12, :cond_37

    .line 108
    invoke-static {p2, v2, v10, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzf([BILcom/google/android/gms/internal/auth/zzey;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    return p1

    :cond_37
    if-eqz v4, :cond_38

    goto/16 :goto_26

    :cond_38
    move-object/from16 p7, p2

    move/from16 p6, v0

    move/from16 p8, v2

    move/from16 p9, v3

    move-object/from16 p11, v5

    move-object/from16 p10, v10

    .line 109
    invoke-static/range {p6 .. p11}, Lcom/google/android/gms/internal/auth/zzdt;->zzl(I[BIILcom/google/android/gms/internal/auth/zzey;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    return p1

    :pswitch_a
    if-ne v4, v12, :cond_3b

    .line 110
    check-cast v10, Lcom/google/android/gms/internal/auth/zzfl;

    .line 111
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v0, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    add-int/2addr v0, p1

    :goto_1b
    if-ge p1, v0, :cond_39

    .line 112
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget-wide v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 113
    invoke-virtual {v10, v2, v3}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    goto :goto_1b

    :cond_39
    if-ne p1, v0, :cond_3a

    return p1

    .line 114
    :cond_3a
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_3b
    if-nez v4, :cond_4a

    .line 115
    check-cast v10, Lcom/google/android/gms/internal/auth/zzfl;

    .line 116
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget-wide v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 117
    invoke-virtual {v10, v6, v7}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    :goto_1c
    if-ge p1, v3, :cond_3d

    .line 118
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v4, :cond_3c

    goto :goto_1d

    .line 119
    :cond_3c
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget-wide v6, v5, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 120
    invoke-virtual {v10, v6, v7}, Lcom/google/android/gms/internal/auth/zzfl;->zze(J)V

    goto :goto_1c

    :cond_3d
    :goto_1d
    return p1

    :pswitch_b
    if-ne v4, v12, :cond_40

    .line 121
    check-cast v10, Lcom/google/android/gms/internal/auth/zzeq;

    .line 122
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v0, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    add-int/2addr v0, p1

    :goto_1e
    if-ge p1, v0, :cond_3e

    .line 123
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    .line 124
    invoke-virtual {v10, v2}, Lcom/google/android/gms/internal/auth/zzeq;->zze(F)V

    add-int/lit8 p1, p1, 0x4

    goto :goto_1e

    :cond_3e
    if-ne p1, v0, :cond_3f

    return p1

    .line 125
    :cond_3f
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_40
    if-ne v4, v7, :cond_4a

    .line 126
    check-cast v10, Lcom/google/android/gms/internal/auth/zzeq;

    .line 127
    invoke-static/range {p2 .. p3}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    .line 128
    invoke-virtual {v10, p1}, Lcom/google/android/gms/internal/auth/zzeq;->zze(F)V

    :goto_1f
    add-int/lit8 p1, v2, 0x4

    if-ge p1, v3, :cond_42

    .line 129
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v4, :cond_41

    goto :goto_20

    .line 130
    :cond_41
    invoke-static {p2, v2}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    .line 131
    invoke-virtual {v10, p1}, Lcom/google/android/gms/internal/auth/zzeq;->zze(F)V

    goto :goto_1f

    :cond_42
    :goto_20
    return p1

    :pswitch_c
    if-ne v4, v12, :cond_45

    .line 132
    check-cast v10, Lcom/google/android/gms/internal/auth/zzej;

    .line 133
    invoke-static {p2, v2, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget v0, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    add-int/2addr v0, p1

    :goto_21
    if-ge p1, v0, :cond_43

    .line 134
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    .line 135
    invoke-virtual {v10, v2, v3}, Lcom/google/android/gms/internal/auth/zzej;->zze(D)V

    add-int/lit8 p1, p1, 0x8

    goto :goto_21

    :cond_43
    if-ne p1, v0, :cond_44

    return p1

    .line 136
    :cond_44
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzf()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object p1

    throw p1

    :cond_45
    if-ne v4, v11, :cond_4a

    .line 137
    check-cast v10, Lcom/google/android/gms/internal/auth/zzej;

    .line 138
    invoke-static/range {p2 .. p3}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v6

    .line 139
    invoke-virtual {v10, v6, v7}, Lcom/google/android/gms/internal/auth/zzej;->zze(D)V

    :goto_22
    add-int/lit8 p1, v2, 0x8

    if-ge p1, v3, :cond_47

    .line 140
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    iget v4, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v4, :cond_46

    goto :goto_23

    .line 141
    :cond_46
    invoke-static {p2, v2}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v6

    .line 142
    invoke-virtual {v10, v6, v7}, Lcom/google/android/gms/internal/auth/zzej;->zze(D)V

    goto :goto_22

    :cond_47
    :goto_23
    return p1

    :goto_24
    if-ge p1, v3, :cond_49

    .line 9
    invoke-static {p2, p1, v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v6

    iget v7, v5, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    if-eq v0, v7, :cond_48

    goto :goto_25

    :cond_48
    move-object/from16 p7, p2

    move-object/from16 p6, v2

    move/from16 p9, v3

    move/from16 p10, v4

    move-object/from16 p11, v5

    move/from16 p8, v6

    .line 10
    invoke-static/range {p6 .. p11}, Lcom/google/android/gms/internal/auth/zzdt;->zzc(Lcom/google/android/gms/internal/auth/zzgh;[BIIILcom/google/android/gms/internal/auth/zzds;)I

    move-result p1

    iget-object v1, v5, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 11
    invoke-interface {v10, v1}, Lcom/google/android/gms/internal/auth/zzey;->add(Ljava/lang/Object;)Z

    move/from16 v3, p4

    goto :goto_24

    :cond_49
    :goto_25
    return p1

    :cond_4a
    :goto_26
    return p3

    :pswitch_data_0
    .packed-switch 0x12
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final zzq(I)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zze:I

    if-lt p1, v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzf:I

    if-gt p1, v0, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzt(II)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method private final zzr(II)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zze:I

    if-lt p1, v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzf:I

    if-gt p1, v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/auth/zzfz;->zzt(II)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method private final zzs(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    add-int/lit8 p1, p1, 0x2

    aget p1, v0, p1

    return p1
.end method

.method private final zzt(II)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    const/4 v1, -0x1

    add-int/2addr v0, v1

    :goto_0
    if-gt p2, v0, :cond_2

    add-int v2, v0, p2

    ushr-int/lit8 v2, v2, 0x1

    mul-int/lit8 v3, v2, 0x3

    iget-object v4, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    .line 2
    aget v4, v4, v3

    if-ne p1, v4, :cond_0

    return v3

    :cond_0
    if-ge p1, v4, :cond_1

    add-int/lit8 v2, v2, -0x1

    move v0, v2

    goto :goto_0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    move p2, v2

    goto :goto_0

    :cond_2
    return v1
.end method

.method private static zzu(I)I
    .locals 0

    ushr-int/lit8 p0, p0, 0x14

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method private final zzv(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    add-int/lit8 p1, p1, 0x1

    aget p1, v0, p1

    return p1
.end method

.method private static zzw(Ljava/lang/Object;J)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method private final zzx(I)Lcom/google/android/gms/internal/auth/zzex;
    .locals 1

    .line 1
    div-int/lit8 p1, p1, 0x3

    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzd:[Ljava/lang/Object;

    add-int/2addr p1, p1

    add-int/lit8 p1, p1, 0x1

    aget-object p1, v0, p1

    check-cast p1, Lcom/google/android/gms/internal/auth/zzex;

    return-object p1
.end method

.method private final zzy(I)Lcom/google/android/gms/internal/auth/zzgh;
    .locals 3

    .line 1
    div-int/lit8 p1, p1, 0x3

    add-int/2addr p1, p1

    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzd:[Ljava/lang/Object;

    aget-object v0, v0, p1

    check-cast v0, Lcom/google/android/gms/internal/auth/zzgh;

    if-eqz v0, :cond_0

    return-object v0

    .line 2
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzge;->zza()Lcom/google/android/gms/internal/auth/zzge;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzd:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    aget-object v1, v1, v2

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/auth/zzge;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzd:[Ljava/lang/Object;

    .line 3
    aput-object v0, v1, p1

    return-object v0
.end method

.method private final zzz(I)Ljava/lang/Object;
    .locals 1

    .line 1
    div-int/lit8 p1, p1, 0x3

    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzd:[Ljava/lang/Object;

    add-int/2addr p1, p1

    aget-object p1, v0, p1

    return-object p1
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 2
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result v3

    iget-object v4, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    .line 3
    aget v4, v4, v1

    const v5, 0xfffff

    and-int/2addr v5, v3

    int-to-long v5, v5

    invoke-static {v3}, Lcom/google/android/gms/internal/auth/zzfz;->zzu(I)I

    move-result v3

    const/16 v7, 0x25

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_3

    .line 4
    :pswitch_0
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 5
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 6
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 7
    :pswitch_1
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 8
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzw(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto/16 :goto_2

    .line 9
    :pswitch_2
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 10
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzl(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 11
    :pswitch_3
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 12
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzw(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto/16 :goto_2

    .line 13
    :pswitch_4
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 14
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzl(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 15
    :pswitch_5
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 16
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzl(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 17
    :pswitch_6
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 18
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzl(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 19
    :pswitch_7
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 20
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 21
    :pswitch_8
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 22
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 23
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 24
    :pswitch_9
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 25
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 26
    :pswitch_a
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 27
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 28
    invoke-static {v3}, Lcom/google/android/gms/internal/auth/zzez;->zza(Z)I

    move-result v3

    goto/16 :goto_2

    .line 29
    :pswitch_b
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 30
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzl(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 31
    :pswitch_c
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 32
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzw(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto/16 :goto_2

    .line 33
    :pswitch_d
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 34
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzl(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 35
    :pswitch_e
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 36
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzw(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto/16 :goto_2

    .line 37
    :pswitch_f
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 38
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzw(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto/16 :goto_2

    .line 39
    :pswitch_10
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 40
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    .line 41
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto/16 :goto_2

    .line 42
    :pswitch_11
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 43
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    .line 44
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_12
    mul-int/lit8 v2, v2, 0x35

    .line 45
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    :pswitch_13
    mul-int/lit8 v2, v2, 0x35

    .line 46
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 47
    :pswitch_14
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 48
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v7

    goto :goto_1

    :pswitch_15
    mul-int/lit8 v2, v2, 0x35

    .line 49
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_16
    mul-int/lit8 v2, v2, 0x35

    .line 50
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_17
    mul-int/lit8 v2, v2, 0x35

    .line 51
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_18
    mul-int/lit8 v2, v2, 0x35

    .line 52
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_19
    mul-int/lit8 v2, v2, 0x35

    .line 53
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_1a
    mul-int/lit8 v2, v2, 0x35

    .line 54
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_1b
    mul-int/lit8 v2, v2, 0x35

    .line 55
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 56
    :pswitch_1c
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 57
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v7

    :cond_0
    :goto_1
    mul-int/lit8 v2, v2, 0x35

    add-int/2addr v2, v7

    goto :goto_3

    :pswitch_1d
    mul-int/lit8 v2, v2, 0x35

    .line 58
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_2

    :pswitch_1e
    mul-int/lit8 v2, v2, 0x35

    .line 59
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzt(Ljava/lang/Object;J)Z

    move-result v3

    invoke-static {v3}, Lcom/google/android/gms/internal/auth/zzez;->zza(Z)I

    move-result v3

    goto :goto_2

    :pswitch_1f
    mul-int/lit8 v2, v2, 0x35

    .line 60
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    goto :goto_2

    :pswitch_20
    mul-int/lit8 v2, v2, 0x35

    .line 61
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto :goto_2

    :pswitch_21
    mul-int/lit8 v2, v2, 0x35

    .line 62
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    goto :goto_2

    :pswitch_22
    mul-int/lit8 v2, v2, 0x35

    .line 63
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto :goto_2

    :pswitch_23
    mul-int/lit8 v2, v2, 0x35

    .line 64
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    goto :goto_2

    :pswitch_24
    mul-int/lit8 v2, v2, 0x35

    .line 65
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzb(Ljava/lang/Object;J)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto :goto_2

    :pswitch_25
    mul-int/lit8 v2, v2, 0x35

    .line 66
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zza(Ljava/lang/Object;J)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    .line 67
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzez;->zzc(J)I

    move-result v3

    :goto_2
    add-int/2addr v2, v3

    :cond_1
    :goto_3
    add-int/lit8 v1, v1, 0x3

    goto/16 :goto_0

    :cond_2
    mul-int/lit8 v2, v2, 0x35

    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzm:Lcom/google/android/gms/internal/auth/zzgy;

    .line 68
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/auth/zzgy;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    add-int/2addr v2, p1

    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method final zzb(Ljava/lang/Object;[BIIILcom/google/android/gms/internal/auth/zzds;)I
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v7, p2

    move/from16 v8, p4

    move-object/from16 v13, p6

    .line 1
    sget-object v2, Lcom/google/android/gms/internal/auth/zzfz;->zzb:Lsun/misc/Unsafe;

    const/16 v16, 0x0

    move/from16 v3, p3

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x0

    const v11, 0xfffff

    const/4 v12, 0x0

    :goto_0
    if-ge v3, v8, :cond_1d

    add-int/lit8 v4, v3, 0x1

    aget-byte v3, v7, v3

    if-gez v3, :cond_0

    .line 2
    invoke-static {v3, v7, v4, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzk(I[BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v4

    iget v3, v13, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    :cond_0
    move v14, v3

    move v3, v4

    ushr-int/lit8 v4, v14, 0x3

    const v17, 0xfffff

    and-int/lit8 v9, v14, 0x7

    const/4 v10, 0x3

    if-le v4, v5, :cond_1

    div-int/2addr v6, v10

    .line 3
    invoke-direct {v0, v4, v6}, Lcom/google/android/gms/internal/auth/zzfz;->zzr(II)I

    move-result v5

    goto :goto_1

    .line 4
    :cond_1
    invoke-direct {v0, v4}, Lcom/google/android/gms/internal/auth/zzfz;->zzq(I)I

    move-result v5

    :goto_1
    const/4 v6, -0x1

    if-ne v5, v6, :cond_2

    move/from16 v7, p5

    move-object v8, v0

    move-object v9, v1

    move-object/from16 v18, v2

    move v2, v3

    move v6, v4

    move v5, v14

    const/4 v10, 0x0

    const v15, 0xfffff

    const/16 v19, -0x1

    goto/16 :goto_19

    .line 60
    :cond_2
    iget-object v6, v0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    add-int/lit8 v19, v5, 0x1

    .line 5
    aget v10, v6, v19

    move/from16 v19, v4

    invoke-static {v10}, Lcom/google/android/gms/internal/auth/zzfz;->zzu(I)I

    move-result v4

    move/from16 v20, v5

    and-int v5, v10, v17

    move-object/from16 v21, v6

    int-to-long v5, v5

    move-wide/from16 v22, v5

    const/16 v5, 0x11

    if-gt v4, v5, :cond_11

    add-int/lit8 v5, v20, 0x2

    .line 6
    aget v5, v21, v5

    ushr-int/lit8 v21, v5, 0x14

    const/4 v6, 0x1

    shl-int v21, v6, v21

    and-int v5, v5, v17

    if-eq v5, v11, :cond_4

    const v15, 0xfffff

    if-eq v11, v15, :cond_3

    int-to-long v6, v11

    .line 7
    invoke-virtual {v2, v1, v6, v7, v12}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_3
    int-to-long v6, v5

    .line 8
    invoke-virtual {v2, v1, v6, v7}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v12

    move v11, v5

    goto :goto_2

    :cond_4
    const v15, 0xfffff

    :goto_2
    const/4 v5, 0x5

    packed-switch v4, :pswitch_data_0

    move-object/from16 v7, p2

    move/from16 p3, v11

    move/from16 v10, v20

    const/4 v5, 0x3

    const/16 v18, -0x1

    move v11, v3

    move-wide/from16 v3, v22

    if-ne v9, v5, :cond_f

    .line 9
    invoke-direct {v0, v10}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v1

    shl-int/lit8 v5, v19, 0x3

    or-int/lit8 v5, v5, 0x4

    move-object v6, v13

    move-object v13, v2

    move-object v2, v7

    move v7, v12

    move/from16 v24, v8

    move-object/from16 v8, p1

    move-wide/from16 v25, v3

    move/from16 v4, v24

    move v3, v11

    move-wide/from16 v11, v25

    .line 10
    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/auth/zzdt;->zzc(Lcom/google/android/gms/internal/auth/zzgh;[BIIILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    move-object v5, v6

    and-int v1, v7, v21

    if-nez v1, :cond_10

    iget-object v1, v5, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 11
    invoke-virtual {v13, v8, v11, v12, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_12

    :pswitch_0
    if-nez v9, :cond_5

    move-object/from16 v7, p2

    .line 15
    invoke-static {v7, v3, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v9

    iget-wide v3, v13, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    .line 16
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzei;->zzc(J)J

    move-result-wide v5

    move-object v3, v2

    move-object v2, v1

    move-object v1, v3

    move/from16 v10, v20

    move-wide/from16 v3, v22

    const/16 v18, -0x1

    .line 17
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object/from16 v24, v2

    move-object v2, v1

    move-object/from16 v1, v24

    or-int v12, v12, v21

    goto/16 :goto_b

    :cond_5
    move-object/from16 v7, p2

    const/16 v18, -0x1

    goto/16 :goto_8

    :pswitch_1
    move-object/from16 v7, p2

    move/from16 v10, v20

    move-wide/from16 v4, v22

    const/16 v18, -0x1

    if-nez v9, :cond_9

    .line 18
    invoke-static {v7, v3, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    iget v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 19
    invoke-static {v6}, Lcom/google/android/gms/internal/auth/zzei;->zzb(I)I

    move-result v6

    .line 20
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_4

    :pswitch_2
    move-object/from16 v7, p2

    move/from16 v10, v20

    move-wide/from16 v4, v22

    const/16 v18, -0x1

    if-nez v9, :cond_9

    .line 21
    invoke-static {v7, v3, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    iget v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 22
    invoke-direct {v0, v10}, Lcom/google/android/gms/internal/auth/zzfz;->zzx(I)Lcom/google/android/gms/internal/auth/zzex;

    move-result-object v9

    if-eqz v9, :cond_7

    .line 23
    invoke-interface {v9}, Lcom/google/android/gms/internal/auth/zzex;->zza()Z

    move-result v9

    if-eqz v9, :cond_6

    goto :goto_3

    .line 25
    :cond_6
    invoke-static {v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/auth/zzgz;

    move-result-object v4

    int-to-long v5, v6

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v14, v5}, Lcom/google/android/gms/internal/auth/zzgz;->zzf(ILjava/lang/Object;)V

    goto/16 :goto_e

    .line 24
    :cond_7
    :goto_3
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_4

    :pswitch_3
    move-object/from16 v7, p2

    move/from16 v10, v20

    move-wide/from16 v4, v22

    const/4 v6, 0x2

    const/16 v18, -0x1

    if-ne v9, v6, :cond_9

    .line 26
    invoke-static {v7, v3, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zza([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    iget-object v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 27
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_4
    or-int v12, v12, v21

    goto/16 :goto_e

    :pswitch_4
    move-object/from16 v7, p2

    move/from16 v10, v20

    move-wide/from16 v4, v22

    const/4 v6, 0x2

    const/16 v18, -0x1

    if-ne v9, v6, :cond_9

    .line 28
    invoke-direct {v0, v10}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v6

    .line 29
    invoke-static {v6, v7, v3, v8, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzd(Lcom/google/android/gms/internal/auth/zzgh;[BIILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    and-int v6, v12, v21

    if-nez v6, :cond_8

    iget-object v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 30
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_4

    .line 31
    :cond_8
    invoke-virtual {v2, v1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    iget-object v9, v13, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 32
    invoke-static {v6, v9}, Lcom/google/android/gms/internal/auth/zzez;->zzg(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 33
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_4

    :cond_9
    move-object v8, v1

    move/from16 p3, v11

    goto/16 :goto_10

    :pswitch_5
    move-object/from16 v7, p2

    move-wide/from16 v4, v22

    const/4 v6, 0x2

    const/16 v18, -0x1

    if-ne v9, v6, :cond_c

    const/high16 v6, 0x20000000

    and-int/2addr v6, v10

    if-nez v6, :cond_a

    .line 34
    invoke-static {v7, v3, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzg([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    goto :goto_5

    .line 35
    :cond_a
    invoke-static {v7, v3, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzh([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    .line 34
    :goto_5
    iget-object v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 36
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_7

    :pswitch_6
    move-object/from16 v7, p2

    move-wide/from16 v4, v22

    const/16 v18, -0x1

    if-nez v9, :cond_c

    .line 37
    invoke-static {v7, v3, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v3

    iget-wide v9, v13, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    const-wide/16 v22, 0x0

    cmp-long v6, v9, v22

    if-eqz v6, :cond_b

    const/4 v6, 0x1

    goto :goto_6

    :cond_b
    const/4 v6, 0x0

    .line 38
    :goto_6
    invoke-static {v1, v4, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzk(Ljava/lang/Object;JZ)V

    :goto_7
    or-int v12, v12, v21

    goto :goto_9

    :cond_c
    :goto_8
    move-object v8, v1

    move/from16 p3, v11

    goto :goto_a

    :pswitch_7
    move-object/from16 v7, p2

    move/from16 p3, v11

    move-wide/from16 v10, v22

    const/16 v18, -0x1

    if-ne v9, v5, :cond_d

    .line 39
    invoke-static {v7, v3}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result v4

    invoke-virtual {v2, v1, v10, v11, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v3, v3, 0x4

    or-int v12, v12, v21

    move/from16 v11, p3

    :goto_9
    move v4, v14

    move/from16 v5, v19

    move/from16 v6, v20

    goto/16 :goto_0

    :cond_d
    move-object v8, v1

    :goto_a
    move v7, v12

    move-object v5, v13

    move/from16 v10, v20

    goto/16 :goto_11

    :pswitch_8
    move-object/from16 v7, p2

    move/from16 p3, v11

    move-wide/from16 v10, v22

    const/4 v4, 0x1

    const/16 v18, -0x1

    if-ne v9, v4, :cond_e

    .line 40
    invoke-static {v7, v3}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v5

    move-object v4, v2

    move-object v2, v1

    move-object v1, v4

    move-wide/from16 v24, v10

    move v11, v3

    move-wide/from16 v3, v24

    move/from16 v10, v20

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object/from16 v24, v2

    move-object v2, v1

    move-object/from16 v1, v24

    goto/16 :goto_c

    :cond_e
    move/from16 v10, v20

    move-object v8, v1

    goto/16 :goto_10

    :pswitch_9
    move-object/from16 v7, p2

    move/from16 p3, v11

    move/from16 v10, v20

    const/16 v18, -0x1

    move v11, v3

    move-wide/from16 v3, v22

    if-nez v9, :cond_f

    .line 41
    invoke-static {v7, v11, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzj([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v5

    iget v6, v13, Lcom/google/android/gms/internal/auth/zzds;->zza:I

    .line 42
    invoke-virtual {v2, v1, v3, v4, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    or-int v12, v12, v21

    move/from16 v11, p3

    move v3, v5

    goto/16 :goto_e

    :pswitch_a
    move-object/from16 v7, p2

    move/from16 p3, v11

    move/from16 v10, v20

    const/16 v18, -0x1

    move v11, v3

    move-wide/from16 v3, v22

    if-nez v9, :cond_f

    .line 43
    invoke-static {v7, v11, v13}, Lcom/google/android/gms/internal/auth/zzdt;->zzm([BILcom/google/android/gms/internal/auth/zzds;)I

    move-result v9

    iget-wide v5, v13, Lcom/google/android/gms/internal/auth/zzds;->zzb:J

    move-object/from16 v24, v2

    move-object v2, v1

    move-object/from16 v1, v24

    .line 44
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object/from16 v24, v2

    move-object v2, v1

    move-object/from16 v1, v24

    or-int v12, v12, v21

    move/from16 v11, p3

    :goto_b
    move v3, v9

    goto :goto_e

    :pswitch_b
    move-object/from16 v7, p2

    move/from16 p3, v11

    move/from16 v10, v20

    const/16 v18, -0x1

    move v11, v3

    move-wide/from16 v3, v22

    if-ne v9, v5, :cond_f

    .line 45
    invoke-static {v7, v11}, Lcom/google/android/gms/internal/auth/zzdt;->zzb([BI)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v5

    .line 46
    invoke-static {v1, v3, v4, v5}, Lcom/google/android/gms/internal/auth/zzhi;->zzm(Ljava/lang/Object;JF)V

    add-int/lit8 v3, v11, 0x4

    goto :goto_d

    :pswitch_c
    move-object/from16 v7, p2

    move/from16 p3, v11

    move/from16 v10, v20

    const/4 v5, 0x1

    const/16 v18, -0x1

    move v11, v3

    move-wide/from16 v3, v22

    if-ne v9, v5, :cond_f

    .line 47
    invoke-static {v7, v11}, Lcom/google/android/gms/internal/auth/zzdt;->zzn([BI)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v5

    .line 48
    invoke-static {v1, v3, v4, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzl(Ljava/lang/Object;JD)V

    :goto_c
    add-int/lit8 v3, v11, 0x8

    :goto_d
    or-int v12, v12, v21

    move/from16 v11, p3

    :goto_e
    move v6, v10

    move v4, v14

    :goto_f
    move/from16 v5, v19

    goto/16 :goto_0

    :cond_f
    move-object v8, v1

    move v3, v11

    :goto_10
    move v7, v12

    move-object v5, v13

    :goto_11
    move-object v13, v2

    goto :goto_13

    .line 12
    :cond_10
    invoke-virtual {v13, v8, v11, v12}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, v5, Lcom/google/android/gms/internal/auth/zzds;->zzc:Ljava/lang/Object;

    .line 13
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/auth/zzez;->zzg(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 14
    invoke-virtual {v13, v8, v11, v12, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_12
    or-int v12, v7, v21

    move-object/from16 v7, p2

    move/from16 v11, p3

    move-object v1, v8

    move v6, v10

    move-object v2, v13

    move v4, v14

    move/from16 v8, p4

    move-object v13, v5

    goto :goto_f

    :goto_13
    move/from16 v11, p3

    move v2, v3

    move v12, v7

    move-object v9, v8

    move-object/from16 v18, v13

    move v5, v14

    move/from16 v6, v19

    const/16 v19, -0x1

    move/from16 v7, p5

    move-object v8, v0

    goto/16 :goto_19

    :cond_11
    move-object v8, v1

    move/from16 v17, v11

    move-object v5, v13

    move/from16 v1, v20

    const v15, 0xfffff

    const/16 v18, -0x1

    move-object v13, v2

    move/from16 v20, v12

    move-wide/from16 v11, v22

    const/16 v2, 0x1b

    if-ne v4, v2, :cond_15

    const/4 v6, 0x2

    if-ne v9, v6, :cond_14

    .line 49
    invoke-virtual {v13, v8, v11, v12}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/auth/zzey;

    .line 50
    invoke-interface {v2}, Lcom/google/android/gms/internal/auth/zzey;->zzc()Z

    move-result v4

    if-nez v4, :cond_13

    .line 51
    invoke-interface {v2}, Lcom/google/android/gms/internal/auth/zzey;->size()I

    move-result v4

    if-nez v4, :cond_12

    const/16 v4, 0xa

    goto :goto_14

    :cond_12
    add-int/2addr v4, v4

    .line 52
    :goto_14
    invoke-interface {v2, v4}, Lcom/google/android/gms/internal/auth/zzey;->zzd(I)Lcom/google/android/gms/internal/auth/zzey;

    move-result-object v2

    .line 53
    invoke-virtual {v13, v8, v11, v12, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_13
    move v10, v1

    move-object v6, v2

    .line 54
    invoke-direct {v0, v10}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v1

    move v4, v3

    move-object v7, v5

    move v2, v14

    move-object/from16 v3, p2

    move/from16 v5, p4

    move v14, v10

    .line 55
    invoke-static/range {v1 .. v7}, Lcom/google/android/gms/internal/auth/zzdt;->zze(Lcom/google/android/gms/internal/auth/zzgh;I[BIILcom/google/android/gms/internal/auth/zzey;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result v1

    move v5, v2

    move-object/from16 v7, p2

    move v3, v1

    move v4, v5

    move-object v1, v8

    move-object v2, v13

    move v6, v14

    move/from16 v11, v17

    move/from16 v5, v19

    move/from16 v12, v20

    move/from16 v8, p4

    :goto_15
    move-object/from16 v13, p6

    goto/16 :goto_0

    :cond_14
    move v5, v14

    move v10, v1

    move-object/from16 v18, v13

    move/from16 v11, v19

    const/16 v19, -0x1

    move v13, v5

    goto/16 :goto_17

    :cond_15
    move v5, v14

    move v14, v1

    const/16 v1, 0x31

    if-gt v4, v1, :cond_17

    move v7, v9

    int-to-long v9, v10

    move-object/from16 v2, p2

    move-object v1, v8

    move-object/from16 v18, v13

    move v8, v14

    move/from16 v6, v19

    const/16 v19, -0x1

    move-object/from16 v14, p6

    move-wide v12, v11

    move v11, v4

    move/from16 v4, p4

    .line 56
    invoke-direct/range {v0 .. v14}, Lcom/google/android/gms/internal/auth/zzfz;->zzp(Ljava/lang/Object;[BIIIIIIJIJLcom/google/android/gms/internal/auth/zzds;)I

    move-result v7

    move v9, v5

    move v11, v6

    move v12, v8

    if-eq v7, v3, :cond_16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v8, p4

    move-object/from16 v13, p6

    move v3, v7

    move v4, v9

    move v5, v11

    move v6, v12

    move/from16 v11, v17

    move-object/from16 v2, v18

    move/from16 v12, v20

    move-object/from16 v7, p2

    goto/16 :goto_0

    :cond_16
    move-object/from16 v8, p0

    move v2, v7

    move v5, v9

    move v6, v11

    move v10, v12

    move/from16 v11, v17

    move/from16 v12, v20

    move-object/from16 v9, p1

    :goto_16
    move/from16 v7, p5

    goto/16 :goto_19

    :cond_17
    move v7, v9

    move-object/from16 v18, v13

    move v9, v4

    move v13, v5

    move-wide v4, v11

    move v12, v14

    move/from16 v11, v19

    const/16 v19, -0x1

    const/16 v0, 0x32

    if-ne v9, v0, :cond_1a

    const/4 v6, 0x2

    if-ne v7, v6, :cond_19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v8, p6

    move-wide v6, v4

    move v5, v12

    move/from16 v4, p4

    .line 57
    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/auth/zzfz;->zzm(Ljava/lang/Object;[BIIIJLcom/google/android/gms/internal/auth/zzds;)I

    move-result v6

    move v10, v5

    if-eq v6, v3, :cond_18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v7, p2

    move/from16 v8, p4

    move v3, v6

    move v6, v10

    move v5, v11

    move v4, v13

    move/from16 v11, v17

    move-object/from16 v2, v18

    move/from16 v12, v20

    goto/16 :goto_15

    :cond_18
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move/from16 v7, p5

    move v2, v6

    goto :goto_18

    :cond_19
    move v10, v12

    :goto_17
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move/from16 v7, p5

    move v2, v3

    :goto_18
    move v6, v11

    move v5, v13

    move/from16 v11, v17

    move/from16 v12, v20

    goto :goto_19

    :cond_1a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move v8, v10

    move v6, v11

    move-wide v10, v4

    move v5, v13

    move/from16 v4, p4

    move-object/from16 v13, p6

    .line 58
    invoke-direct/range {v0 .. v13}, Lcom/google/android/gms/internal/auth/zzfz;->zzn(Ljava/lang/Object;[BIIIIIIIJILcom/google/android/gms/internal/auth/zzds;)I

    move-result v7

    move-object v8, v0

    move-object v9, v1

    move v10, v12

    if-eq v7, v3, :cond_1b

    move-object/from16 v13, p6

    move v4, v5

    move v5, v6

    move v3, v7

    move-object v0, v8

    move-object v1, v9

    move v6, v10

    move/from16 v11, v17

    move-object/from16 v2, v18

    move/from16 v12, v20

    move-object/from16 v7, p2

    move/from16 v8, p4

    goto/16 :goto_0

    :cond_1b
    move v2, v7

    move/from16 v11, v17

    move/from16 v12, v20

    goto/16 :goto_16

    :goto_19
    if-ne v5, v7, :cond_1c

    if-eqz v7, :cond_1c

    move/from16 v0, p4

    move v3, v2

    move v4, v5

    goto :goto_1a

    .line 59
    :cond_1c
    invoke-static {v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/auth/zzgz;

    move-result-object v4

    move-object/from16 v1, p2

    move/from16 v3, p4

    move v0, v5

    move-object/from16 v5, p6

    .line 60
    invoke-static/range {v0 .. v5}, Lcom/google/android/gms/internal/auth/zzdt;->zzi(I[BIILcom/google/android/gms/internal/auth/zzgz;Lcom/google/android/gms/internal/auth/zzds;)I

    move-result v2

    move v5, v0

    move-object/from16 v7, p2

    move-object/from16 v13, p6

    move v4, v5

    move v5, v6

    move-object v0, v8

    move-object v1, v9

    move v6, v10

    move v8, v3

    move v3, v2

    move-object/from16 v2, v18

    goto/16 :goto_0

    :cond_1d
    move v7, v8

    move-object v8, v0

    move v0, v7

    move/from16 v7, p5

    move-object v9, v1

    move-object/from16 v18, v2

    move/from16 v17, v11

    move/from16 v20, v12

    const v15, 0xfffff

    :goto_1a
    if-eq v11, v15, :cond_1e

    int-to-long v1, v11

    move-object/from16 v13, v18

    .line 61
    invoke-virtual {v13, v9, v1, v2, v12}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_1e
    iget v1, v8, Lcom/google/android/gms/internal/auth/zzfz;->zzj:I

    :goto_1b
    iget v2, v8, Lcom/google/android/gms/internal/auth/zzfz;->zzk:I

    if-ge v1, v2, :cond_21

    iget-object v2, v8, Lcom/google/android/gms/internal/auth/zzfz;->zzi:[I

    .line 62
    aget v2, v2, v1

    iget-object v5, v8, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    .line 63
    aget v5, v5, v2

    .line 64
    invoke-direct {v8, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result v5

    and-int/2addr v5, v15

    int-to-long v5, v5

    .line 65
    invoke-static {v9, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_1f

    goto :goto_1c

    .line 66
    :cond_1f
    invoke-direct {v8, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzx(I)Lcom/google/android/gms/internal/auth/zzex;

    move-result-object v6

    if-nez v6, :cond_20

    :goto_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 67
    :cond_20
    check-cast v5, Lcom/google/android/gms/internal/auth/zzfq;

    .line 68
    invoke-direct {v8, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzz(I)Ljava/lang/Object;

    move-result-object v0

    .line 69
    check-cast v0, Lcom/google/android/gms/internal/auth/zzfp;

    const/4 v0, 0x0

    .line 70
    throw v0

    :cond_21
    if-nez v7, :cond_23

    if-ne v3, v0, :cond_22

    goto :goto_1d

    .line 71
    :cond_22
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzd()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object v0

    throw v0

    :cond_23
    if-gt v3, v0, :cond_24

    if-ne v4, v7, :cond_24

    :goto_1d
    return v3

    .line 72
    :cond_24
    invoke-static {}, Lcom/google/android/gms/internal/auth/zzfa;->zzd()Lcom/google/android/gms/internal/auth/zzfa;

    move-result-object v0

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzd()Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzg:Lcom/google/android/gms/internal/auth/zzfw;

    check-cast v0, Lcom/google/android/gms/internal/auth/zzeu;

    const/4 v1, 0x4

    const/4 v2, 0x0

    .line 1
    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/gms/internal/auth/zzeu;->zzi(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final zze(Ljava/lang/Object;)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzj:I

    :goto_0
    iget v1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzk:I

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzi:[I

    aget v1, v1, v0

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result v1

    const v2, 0xfffff

    and-int/2addr v1, v2

    int-to-long v1, v1

    .line 2
    invoke-static {p1, v1, v2}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 3
    move-object v4, v3

    check-cast v4, Lcom/google/android/gms/internal/auth/zzfq;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/auth/zzfq;->zzc()V

    .line 4
    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzi:[I

    .line 5
    array-length v0, v0

    :goto_1
    if-ge v1, v0, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzl:Lcom/google/android/gms/internal/auth/zzfk;

    iget-object v3, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzi:[I

    .line 6
    aget v3, v3, v1

    int-to-long v3, v3

    invoke-virtual {v2, p1, v3, v4}, Lcom/google/android/gms/internal/auth/zzfk;->zza(Ljava/lang/Object;J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzm:Lcom/google/android/gms/internal/auth/zzgy;

    .line 7
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/auth/zzgy;->zze(Ljava/lang/Object;)V

    return-void
.end method

.method public final zzf(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 65
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 1
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 2
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result v1

    const v2, 0xfffff

    and-int/2addr v2, v1

    int-to-long v2, v2

    iget-object v4, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    .line 3
    aget v4, v4, v0

    invoke-static {v1}, Lcom/google/android/gms/internal/auth/zzfz;->zzu(I)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_1

    .line 4
    :pswitch_0
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzC(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 5
    :pswitch_1
    invoke-direct {p0, p2, v4, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 6
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 7
    invoke-direct {p0, p1, v4, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzE(Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 8
    :pswitch_2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzC(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 9
    :pswitch_3
    invoke-direct {p0, p2, v4, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 10
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 11
    invoke-direct {p0, p1, v4, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzE(Ljava/lang/Object;II)V

    goto/16 :goto_1

    :pswitch_4
    iget-object v1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzp:Lcom/google/android/gms/internal/auth/zzfr;

    .line 12
    invoke-static {v1, p1, p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzgj;->zzi(Lcom/google/android/gms/internal/auth/zzfr;Ljava/lang/Object;Ljava/lang/Object;J)V

    goto/16 :goto_1

    :pswitch_5
    iget-object v1, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzl:Lcom/google/android/gms/internal/auth/zzfk;

    .line 13
    invoke-virtual {v1, p1, p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzfk;->zzb(Ljava/lang/Object;Ljava/lang/Object;J)V

    goto/16 :goto_1

    .line 14
    :pswitch_6
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzB(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 15
    :pswitch_7
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 16
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/android/gms/internal/auth/zzhi;->zzo(Ljava/lang/Object;JJ)V

    .line 17
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 18
    :pswitch_8
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 19
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzn(Ljava/lang/Object;JI)V

    .line 20
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 21
    :pswitch_9
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 22
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/android/gms/internal/auth/zzhi;->zzo(Ljava/lang/Object;JJ)V

    .line 23
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 24
    :pswitch_a
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 25
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzn(Ljava/lang/Object;JI)V

    .line 26
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 27
    :pswitch_b
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 28
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzn(Ljava/lang/Object;JI)V

    .line 29
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 30
    :pswitch_c
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 31
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzn(Ljava/lang/Object;JI)V

    .line 32
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 33
    :pswitch_d
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 34
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 35
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 36
    :pswitch_e
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzB(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 37
    :pswitch_f
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 38
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzp(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 39
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 40
    :pswitch_10
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 41
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzt(Ljava/lang/Object;J)Z

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzk(Ljava/lang/Object;JZ)V

    .line 42
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 43
    :pswitch_11
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzn(Ljava/lang/Object;JI)V

    .line 45
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto :goto_1

    .line 46
    :pswitch_12
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/android/gms/internal/auth/zzhi;->zzo(Ljava/lang/Object;JJ)V

    .line 48
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto :goto_1

    .line 49
    :pswitch_13
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzn(Ljava/lang/Object;JI)V

    .line 51
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto :goto_1

    .line 52
    :pswitch_14
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/android/gms/internal/auth/zzhi;->zzo(Ljava/lang/Object;JJ)V

    .line 54
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto :goto_1

    .line 55
    :pswitch_15
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/android/gms/internal/auth/zzhi;->zzo(Ljava/lang/Object;JJ)V

    .line 57
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto :goto_1

    .line 58
    :pswitch_16
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zzb(Ljava/lang/Object;J)F

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/gms/internal/auth/zzhi;->zzm(Ljava/lang/Object;JF)V

    .line 60
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    goto :goto_1

    .line 61
    :pswitch_17
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzG(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 62
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/auth/zzhi;->zza(Ljava/lang/Object;J)D

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/android/gms/internal/auth/zzhi;->zzl(Ljava/lang/Object;JD)V

    .line 63
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/auth/zzfz;->zzD(Ljava/lang/Object;I)V

    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x3

    goto/16 :goto_0

    .line 65
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzm:Lcom/google/android/gms/internal/auth/zzgy;

    .line 64
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/auth/zzgj;->zzf(Lcom/google/android/gms/internal/auth/zzgy;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzg(Ljava/lang/Object;[BIILcom/google/android/gms/internal/auth/zzds;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzh:Z

    if-eqz v0, :cond_0

    invoke-direct/range {p0 .. p5}, Lcom/google/android/gms/internal/auth/zzfz;->zzo(Ljava/lang/Object;[BIILcom/google/android/gms/internal/auth/zzds;)I

    return-void

    :cond_0
    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move-object v7, p5

    .line 2
    invoke-virtual/range {v1 .. v7}, Lcom/google/android/gms/internal/auth/zzfz;->zzb(Ljava/lang/Object;[BIIILcom/google/android/gms/internal/auth/zzds;)I

    return-void
.end method

.method public final zzh(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 2
    invoke-direct {p0, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result v3

    const v4, 0xfffff

    and-int v5, v3, v4

    int-to-long v5, v5

    invoke-static {v3}, Lcom/google/android/gms/internal/auth/zzfz;->zzu(I)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_3

    .line 3
    :pswitch_0
    invoke-direct {p0, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzs(I)I

    move-result v3

    and-int/2addr v3, v4

    int-to-long v3, v3

    .line 4
    invoke-static {p1, v3, v4}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v7

    .line 5
    invoke-static {p2, v3, v4}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    if-ne v7, v3, :cond_0

    .line 6
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 7
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzgj;->zzh(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    goto/16 :goto_2

    .line 8
    :pswitch_1
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 9
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzgj;->zzh(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    goto :goto_1

    .line 10
    :pswitch_2
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 11
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzgj;->zzh(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    :goto_1
    if-nez v3, :cond_1

    goto/16 :goto_2

    .line 12
    :pswitch_3
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 13
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 14
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzgj;->zzh(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_3

    .line 15
    :pswitch_4
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 16
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    goto/16 :goto_3

    .line 17
    :pswitch_5
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 18
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v4

    if-ne v3, v4, :cond_0

    goto/16 :goto_3

    .line 19
    :pswitch_6
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 20
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    goto/16 :goto_3

    .line 21
    :pswitch_7
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 22
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v4

    if-ne v3, v4, :cond_0

    goto/16 :goto_3

    .line 23
    :pswitch_8
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 24
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v4

    if-ne v3, v4, :cond_0

    goto/16 :goto_3

    .line 25
    :pswitch_9
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 26
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v4

    if-ne v3, v4, :cond_0

    goto/16 :goto_3

    .line 27
    :pswitch_a
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 28
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 29
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzgj;->zzh(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_3

    .line 30
    :pswitch_b
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 31
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 32
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzgj;->zzh(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_3

    .line 33
    :pswitch_c
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 34
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 35
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/auth/zzgj;->zzh(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_3

    .line 36
    :pswitch_d
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 37
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzt(Ljava/lang/Object;J)Z

    move-result v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzt(Ljava/lang/Object;J)Z

    move-result v4

    if-ne v3, v4, :cond_0

    goto/16 :goto_3

    .line 38
    :pswitch_e
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 39
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v4

    if-ne v3, v4, :cond_0

    goto/16 :goto_3

    .line 40
    :pswitch_f
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 41
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    goto/16 :goto_3

    .line 42
    :pswitch_10
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 43
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzc(Ljava/lang/Object;J)I

    move-result v4

    if-ne v3, v4, :cond_0

    goto :goto_3

    .line 44
    :pswitch_11
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 45
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    goto :goto_3

    .line 46
    :pswitch_12
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 47
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzd(Ljava/lang/Object;J)J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    goto :goto_3

    .line 48
    :pswitch_13
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 49
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzb(Ljava/lang/Object;J)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    .line 50
    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zzb(Ljava/lang/Object;J)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v4

    if-ne v3, v4, :cond_0

    goto :goto_3

    .line 51
    :pswitch_14
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/gms/internal/auth/zzfz;->zzF(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 52
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zza(Ljava/lang/Object;J)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    .line 53
    invoke-static {p2, v5, v6}, Lcom/google/android/gms/internal/auth/zzhi;->zza(Ljava/lang/Object;J)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    goto :goto_3

    :cond_0
    :goto_2
    return v1

    :cond_1
    :goto_3
    add-int/lit8 v2, v2, 0x3

    goto/16 :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzm:Lcom/google/android/gms/internal/auth/zzgy;

    .line 54
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/auth/zzgy;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzm:Lcom/google/android/gms/internal/auth/zzgy;

    .line 55
    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/auth/zzgy;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v1

    :cond_3
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final zzi(Ljava/lang/Object;)Z
    .locals 14

    const v0, 0xfffff

    const/4 v1, 0x0

    const/4 v2, 0x0

    const v3, 0xfffff

    const/4 v4, 0x0

    .line 1
    :goto_0
    iget v5, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzj:I

    const/4 v6, 0x1

    if-ge v2, v5, :cond_b

    iget-object v5, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzi:[I

    aget v9, v5, v2

    iget-object v5, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    .line 2
    aget v5, v5, v9

    .line 3
    invoke-direct {p0, v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzv(I)I

    move-result v13

    iget-object v7, p0, Lcom/google/android/gms/internal/auth/zzfz;->zzc:[I

    add-int/lit8 v8, v9, 0x2

    .line 4
    aget v7, v7, v8

    and-int v8, v7, v0

    ushr-int/lit8 v7, v7, 0x14

    shl-int v12, v6, v7

    if-eq v8, v3, :cond_1

    if-eq v8, v0, :cond_0

    sget-object v3, Lcom/google/android/gms/internal/auth/zzfz;->zzb:Lsun/misc/Unsafe;

    int-to-long v6, v8

    .line 5
    invoke-virtual {v3, p1, v6, v7}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    :cond_0
    move v11, v4

    move v10, v8

    goto :goto_1

    :cond_1
    move v10, v3

    move v11, v4

    :goto_1
    const/high16 v3, 0x10000000

    and-int/2addr v3, v13

    move-object v7, p0

    move-object v8, p1

    if-eqz v3, :cond_3

    .line 6
    invoke-direct/range {v7 .. v12}, Lcom/google/android/gms/internal/auth/zzfz;->zzH(Ljava/lang/Object;IIII)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    return v1

    :cond_3
    :goto_2
    invoke-static {v13}, Lcom/google/android/gms/internal/auth/zzfz;->zzu(I)I

    move-result p1

    const/16 v3, 0x9

    if-eq p1, v3, :cond_9

    const/16 v3, 0x11

    if-eq p1, v3, :cond_9

    const/16 v3, 0x1b

    if-eq p1, v3, :cond_7

    const/16 v3, 0x3c

    if-eq p1, v3, :cond_6

    const/16 v3, 0x44

    if-eq p1, v3, :cond_6

    const/16 v3, 0x31

    if-eq p1, v3, :cond_7

    const/16 v3, 0x32

    if-eq p1, v3, :cond_4

    goto :goto_4

    :cond_4
    and-int p1, v13, v0

    int-to-long v3, p1

    .line 13
    invoke-static {v8, v3, v4}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    .line 14
    check-cast p1, Lcom/google/android/gms/internal/auth/zzfq;

    .line 15
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_4

    .line 20
    :cond_5
    invoke-direct {p0, v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzz(I)Ljava/lang/Object;

    move-result-object p1

    .line 21
    check-cast p1, Lcom/google/android/gms/internal/auth/zzfp;

    const/4 p1, 0x0

    .line 22
    throw p1

    .line 16
    :cond_6
    invoke-direct {p0, v8, v5, v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzJ(Ljava/lang/Object;II)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 17
    invoke-direct {p0, v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object p1

    invoke-static {v8, v13, p1}, Lcom/google/android/gms/internal/auth/zzfz;->zzI(Ljava/lang/Object;ILcom/google/android/gms/internal/auth/zzgh;)Z

    move-result p1

    if-nez p1, :cond_a

    return v1

    :cond_7
    and-int p1, v13, v0

    int-to-long v3, p1

    .line 7
    invoke-static {v8, v3, v4}, Lcom/google/android/gms/internal/auth/zzhi;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 8
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_a

    .line 9
    invoke-direct {p0, v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object v3

    const/4 v4, 0x0

    .line 10
    :goto_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_a

    .line 11
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 12
    invoke-interface {v3, v5}, Lcom/google/android/gms/internal/auth/zzgh;->zzi(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_8

    return v1

    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 18
    :cond_9
    invoke-direct/range {v7 .. v12}, Lcom/google/android/gms/internal/auth/zzfz;->zzH(Ljava/lang/Object;IIII)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 19
    invoke-direct {p0, v9}, Lcom/google/android/gms/internal/auth/zzfz;->zzy(I)Lcom/google/android/gms/internal/auth/zzgh;

    move-result-object p1

    invoke-static {v8, v13, p1}, Lcom/google/android/gms/internal/auth/zzfz;->zzI(Ljava/lang/Object;ILcom/google/android/gms/internal/auth/zzgh;)Z

    move-result p1

    if-nez p1, :cond_a

    return v1

    :cond_a
    :goto_4
    add-int/lit8 v2, v2, 0x1

    move-object p1, v8

    move v3, v10

    move v4, v11

    goto/16 :goto_0

    :cond_b
    move-object v7, p0

    return v6
.end method
